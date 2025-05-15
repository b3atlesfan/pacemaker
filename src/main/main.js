import { app, BrowserWindow, ipcMain  } from 'electron';
import isDev from 'electron-is-dev'
import * as path from 'path';
import * as fs from 'fs';
import { findSourceMap } from 'module';
import * as XLSX from "xlsx";
import * as os from "os";
import * as csvParser from "csv-parser";
import * as stringify from "csv-stringify/sync";
import Papa from "papaparse";
import { SettingsManager } from './settingsManager.ts';


import { setupDatabase, storeEvent, getVariablesByName, createRun, getNumberOfEventsPerBeat, getBranches } from './database';


let mainWindow;
let client;


//const EXCEL_FILE_PATH = "event_log.csv";




function isFileLocked(filePath) {
  try {
    fs.accessSync(filePath, fs.constants.R_OK | fs.constants.W_OK);
    return false;
  } catch (err) {
    return true;
  }
}

function createWindow() {
  mainWindow = new BrowserWindow({
    width: 800,
    height: 600,
    webPreferences: {
      preload: path.join(__dirname, '../preload/preload.js'),
    },
  });
  mainWindow.maximize();

  if(isDev) {
    mainWindow.loadURL('http://localhost:5173');
  }
  else {
    mainWindow.loadURL(`file://${path.join(__dirname, '../renderer/index.html')}`)
  }
  mainWindow.on('closed', () => mainWindow = null);

  
  mainWindow.webContents.on('console-message', (event, level, message) => {
    console.log(`[CSP Message] ${message}`);
  });
}

const testDatabase = async () => {
  await setupDatabase();
}

app.whenReady().then(() => {

  testDatabase();


  ipcMain.handle('ping', () => 'pong');
  ipcMain.handle('sendString', (event, arg) => {
    console.log("Received " + arg); // prints "Hello, World!"
    fs.writeFile('receivedString.txt', arg, (err) => {
      if (err) {
        console.error('Error writing to file', err);
      } else {
        console.log('String written to file');
      }
    });
    return "pong";
  });
  ipcMain.handle('sendFile', (event, arg, arg2) => {
    console.log("Received file " + arg);
    fs.writeFile(arg2, arg, (err) => {
      if (err) {
        console.error('Error writing file', err);
      } else {
        console.log('File written');
      }
    });
    return "pong";
  });
  ipcMain.handle('fetchFile', (event, arg) => {
    //console.log("Fetching file from " + arg);
    try {
      let fileContent = fs.readFileSync(arg, 'utf8');
      //console.log("File content: " + fileContent);
      return fileContent;
    } catch (err) {
      console.error('Error reading file', err);
      return "{}";
    }
  });
  ipcMain.handle('startListening', () => {
    startListening();

  });

  ipcMain.handle('readFromExcelFile', async (event, arg) => {

    // get 

    if (!arg) {
      return "null";
    }
    var res = await getBranches();
    return res;

    return;

    console.log("CurrentProjectPath: " + SettingsManager.currentProjectPath.value);
  
    const filePath = SettingsManager.currentProjectPath.value + "/" + arg + ".csv";
    console.log("FilePath: " + filePath);
    if (!fs.existsSync(filePath) || isFileLocked(filePath)) {
      return "null";
    }
  
    const rows = [];
    try {
      const fileContent = fs.readFileSync(filePath, 'utf8');
      return fileContent;
      const lines = fileContent.split('\n');
      lines.forEach((line) => {
        const parsedLine = line.split(';').map((value) => value.trim());
        rows.push(parsedLine);
      });
      const returnVal = { SheetNames: [arg], Sheets: { [arg]: rows } };
      return returnVal;
    } catch (err) {
      console.error('Error reading CSV file:', err);
      return "null";
    }
  });

  function allPossibleKeys(array) {
    const keys = new Set();
    array.forEach(obj => {
      Object.keys(obj).forEach(key => keys.add(key));
    });
    return Array.from(keys);
  }

  function arrayToCSV(array) {
    if (array.length === 0) {
      return '';
    }
  
    const keys = allPossibleKeys(array);
    const header = keys.join(';');
    const rows = array.map(obj => 
      keys.map(key => {
        let value = obj[key];
        if (typeof value === 'number') {
          value = value.toString().replace('.', ',');
        }
        return value;
      }).join(';')
    );
    const csvString = `${header}\n${rows.join('\n')}`;
  
    return csvString;
  }
  
  var lastSheetName = "";
  var runID = 0;
  
  ipcMain.handle('writeToExcelFile', async (event, sheetName, arg) => {
    
    if(lastSheetName !== sheetName) {
      lastSheetName = sheetName;
      runID = await createRun();
    }

    storeEvent(runID, arg.name, arg.variables, arg.timestamp);
    
    return;
    const eventObj = arg;

    const filePath = SettingsManager.currentProjectPath.value + "/" + sheetName + ".csv";
  
    let data = [];
    if (fs.existsSync(filePath) && !isFileLocked(filePath)) {
      const fileContent = fs.readFileSync(filePath, 'utf8');
      data = Papa.parse(fileContent, { header: true }).data; 
    }
    
    data.push(eventObj); 
    
    // Convert the data back to CSV format
    const csvContent = arrayToCSV(data);
  
    try {
      fs.writeFileSync(filePath, csvContent, 'utf8');
      console.log('CSV file written successfully');
    } catch (err) {
      console.error('Error writing CSV file:', err);
    }
  });
  createWindow();
});

ipcMain.handle('load-settings', (event, path) => {
  return SettingsManager.loadSettings(path);
});

ipcMain.handle('save-settings', (event, path, settings) => {
  return SettingsManager.saveSettings(path, settings);
});

let server;

function startListening() {
  // Start listening for client requests on port 3333

  const net = require('net');

  if (server) return;

  server = net.createServer((socket) => {
    console.log('client connected');
    socket.on('data', (data) => {
      //stopTimeoutCounter();
      console.log(`Received data: ${data}`);
      socket.write('pong');
      mainWindow.webContents.send('asynchronous-message', `${data}`);

      //startTimeoutCounter();
    });
    socket.on('close', () => {
      console.log('Client disconnected');
    });
    socket.on('error', (err) => {
      console.log('Error: ' + err);
    });
  });

  server.listen(3333, '127.0.0.1', () => {
    console.log('Server listening on port 3333');
  });
}

let timeoutCounter;
function startTimeoutCounter() {
  if (timeoutCounter) return;
  timeoutCounter = setTimeout(() => {
    console.log('Timeout reached');
    mainWindow.webContents.send('asynchronous-message', 'Timeout reached');
  }, 3000);
}

function stopTimeoutCounter() {
  if (timeoutCounter) {
    clearTimeout(timeoutCounter);
    timeoutCounter = null;
  }
}

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit();
  }
});

app.on('web-contents-created', () => {
});

app.on('activate', () => {
  if (mainWindow == null) {
    createWindow();
  }
});


