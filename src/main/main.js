import { app, BrowserWindow, ipcMain  } from 'electron';
import isDev from 'electron-is-dev'
import * as path from 'path';
import * as fs from 'fs';
import { findSourceMap } from 'module';
import * as XLSX from "xlsx";
import * as os from "os";

let mainWindow;
let client;


const EXCEL_FILE_PATH = "event_log.xlsx";


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
    let filePath = arg + ".xlsx";
    let workbook;
    let worksheet;
    let buffer;

    if (fs.existsSync(filePath) && !isFileLocked(filePath)) {
      buffer = fs.readFileSync(filePath);
      workbook = XLSX.read(buffer, { type: "buffer" });
      return workbook;
    } else {
      return "null";
    }
  })

  ipcMain.handle('writeToExcelFile', (event, sheetName, arg) => {

    const eventObj = JSON.parse(arg);

    let workbook;
    let worksheet;
    let buffer;

    let arr_args = Object.keys(eventObj.args);

    // Time, Name, One column per item in arr_args_in_arg
    let titleRow = ["Timestamp", "eventName", ...arr_args];
    
    // Check if file exists
    if (fs.existsSync(EXCEL_FILE_PATH) && !isFileLocked(EXCEL_FILE_PATH)) {
      buffer = fs.readFileSync(EXCEL_FILE_PATH);
      workbook = XLSX.read(buffer, { type: "buffer" });
      worksheet = workbook.Sheets[sheetName] 
      if(!worksheet) {
        worksheet = XLSX.utils.aoa_to_sheet([titleRow]);
        workbook.SheetNames.push(sheetName);
      }
    } else {
      workbook = XLSX.utils.book_new();
      worksheet = XLSX.utils.aoa_to_sheet([titleRow]);
      workbook.SheetNames.push(sheetName);
    }

    const data = XLSX.utils.sheet_to_json(worksheet, { header: 1 })
    const newRow = [
      new Date().toISOString(),
      eventObj.name,
      ...arr_args.map(arg => eventObj.args[arg])
    ];

    data.push(newRow);
    const newWorksheet = XLSX.utils.aoa_to_sheet(data);

    workbook.Sheets[sheetName] = newWorksheet;

    buffer = XLSX.write(workbook, { type: "buffer" });
    fs.writeFileSync(EXCEL_FILE_PATH, buffer);
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


