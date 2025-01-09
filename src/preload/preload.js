const { contextBridge, ipcRenderer } = require('electron')

contextBridge.exposeInMainWorld('versions', {
  ping: () => ipcRenderer.invoke('ping'),
  sendString: (string) => ipcRenderer.invoke('sendString', string),
  sendFile: (file, destinationPath) => ipcRenderer.invoke('sendFile', file, destinationPath),
  fetchFile: (filePath) => ipcRenderer.invoke('fetchFile', filePath),
  pingGameEngine: () => ipcRenderer.invoke('pingGameEngine'),
  // we can also expose variables, not just functions HALLO?
})

contextBridge.exposeInMainWorld('server', {
  startListening: () => ipcRenderer.invoke('pingGameEngine'),
  onMessage: (channel, callback) => ipcRenderer.on(channel, (event, args) => callback(args))
})