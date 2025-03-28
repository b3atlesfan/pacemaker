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

let mainWindow;
let client;


const EXCEL_FILE_PATH = "event_log.csv";


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

app.whenReady().then(() => {
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

  ipcMain.handle('readFromExcelFile', (event, arg) => {
    if (!arg) {
      return "null";
    }
  
    const filePath = `${arg}.csv`;
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

  function arrayToCSV(array) {
    if (array.length === 0) {
      return '';
    }
  
    const keys = Object.keys(array[array.length - 1]);
    const header = keys.join(';');
    const rows = array.map(obj => keys.map(key => obj[key]).join(';'));
    const csvString = `${header}\n${rows.join('\n')}`;
  
    return csvString;
  }
  
  
  ipcMain.handle('writeToExcelFile', (event, sheetName, arg) => {
    const eventObj = arg;

    const filePath = EXCEL_FILE_PATH;
  
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


