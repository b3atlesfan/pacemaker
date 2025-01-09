import { app, BrowserWindow, ipcMain  } from 'electron';
import isDev from 'electron-is-dev'
import * as path from 'path';
import * as fs from 'fs';
import { findSourceMap } from 'module';

let mainWindow;
let client;

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
  ipcMain.handle('pingGameEngine', () => {
    startListening();

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
      stopTimeoutCounter();
      console.log(`Received data: ${data}`);
      socket.write('pong');
      mainWindow.webContents.send('asynchronous-message', `${data}`);

      startTimeoutCounter();
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
