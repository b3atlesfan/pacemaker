const { contextBridge, ipcRenderer } = require('electron')

contextBridge.exposeInMainWorld('versions', {
  ping: () => ipcRenderer.invoke('ping'),
  sendString: (string) => ipcRenderer.invoke('sendString', string),
  sendFile: (file) => ipcRenderer.invoke('sendFile', file),
  // we can also expose variables, not just functions
})