const { contextBridge, ipcRenderer } = require('electron')

contextBridge.exposeInMainWorld('versions', {
  ping: () => ipcRenderer.invoke('ping'),
  sendString: (string) => ipcRenderer.invoke('sendString', string),
  sendFile: (file, destinationPath) => ipcRenderer.invoke('sendFile', file, destinationPath),
  fetchFile: (filePath) => ipcRenderer.invoke('fetchFile', filePath),
  // we can also expose variables, not just functions
})