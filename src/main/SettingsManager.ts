import { app } from 'electron';
import * as fs from 'fs';
import * as path from 'path';
import { URL } from 'url';
import { ref } from 'vue';

//const settingsFilePath = "C:\\git-projects\\Vue\\pacemaker\\settings.json";

const defaultSettings = {
  unityProjectPath: '',
};

export class SettingsManager {
  static loadSettings(settingsFilePath: string) {
    SettingsManager.currentProjectPath.value = path.dirname(settingsFilePath);

    if(!settingsFilePath) {
      return;
    }
    try {
      if (fs.existsSync(settingsFilePath)) {
        const data = fs.readFileSync(settingsFilePath, 'utf8');
        return JSON.parse(data);
      } else {
        //this.saveSettings(defaultSettings);
        return '';
      }
    } catch (error) {
      console.error('Error loading settings:', error);
      return '';
    }
  }

  static saveSettings(settingsFilePath :string, settings : object) {
    try {
      var ret = "";
      if(!fs.existsSync(path.dirname(settingsFilePath))) {
        console.log('Directory does not exist. Creating directory ' + path.dirname(settingsFilePath));
        fs.mkdirSync(path.dirname(settingsFilePath), { recursive: true });
        ret = 'Directory does not exist. Creating directory \n' + path.dirname(settingsFilePath);
      }
      fs.writeFileSync(settingsFilePath, JSON.stringify(settings, null, 2), 'utf8');
      return ret;
    } catch (error) {
      console.error('Error saving settings:', error);
      return 'Error saving settings:\n' + error;
    }
  }

  static currentProjectPath = ref('C:/git-projects/Vue/pacemaker/projects');

  static setCurrentProjectPath(path: string) {
    this.currentProjectPath.value = path;
  }
}