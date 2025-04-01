import { reactive, ref, watch } from 'vue';
import { useDesignVariablesStore, DesignVariable} from "@/store/designVariables";

let _designVariablesStore: ReturnType<typeof useDesignVariablesStore>;

function getDesignVariablesStore() {
  if (!_designVariablesStore) {
    _designVariablesStore = useDesignVariablesStore();
  }
  return _designVariablesStore;
}

export const settings = reactive<{ [key: string]: any }>({
  Name: ''
});

export const currentProjectPath = ref(localStorage.getItem('currentProjectPath') || 'C:/git-projects/Vue/pacemaker/projects/lostForest');
export const recentlyLoadedPaths = ref(localStorage.getItem('recentlyLoadedPaths') ? JSON.parse(localStorage.getItem('recentlyLoadedPaths')!) : []);

currentProjectPath.value = localStorage.getItem('currentProjectPath') || currentProjectPath.value;

const path2 = "C:/git-projects/Unity/TheLostForest-master/Packages/com.unity.pacemaker-for-unity/Runtime/Temporary";
const savedState = localStorage.getItem('currentState');
const initialState = savedState && savedState != "undefined" ? JSON.parse(savedState) : {
  unityPath: path2,
  outFile: "designerVarsFromPacemaker.json",
  inFile: "designerVarsFromUnity.json",
  lastMessage: "lM",
  messageAge: 0.0,
  fetchLoopEnabled: false,
  sendLoopEnabled: false,
  favoritesOnly: false,
  onlyPublic: true,
  onlyWithWeight: false,
  pathFilterText: "",
  onlyruntimeModified: false,
};

export const currentState = reactive(initialState);
watch(currentState, (newValue) => {
  //console.log('currentState changed:', newValue);
  localStorage.setItem('currentState', JSON.stringify(newValue));
}, { deep: true });


// Function to load settings
export async function loadSettings() {
  const loadedSettings = await window.settings.load(currentProjectPath.value + '/settings.json');
    if (!loadedSettings) {
        console.error('No settings found!');
        return;
    }
  const dv_raw = JSON.parse(loadedSettings.variables);
  const dv_arr: DesignVariable[] = Object.values(dv_raw);
  //settings.value = loadedSettings;
  for (const key in loadedSettings) {
    settings[key] = loadedSettings[key];
  }

  getDesignVariablesStore().allVariables = dv_arr;
  currentState.messageAge += 1;
  if(!loadedSettings.currentState) {
    return;
  }
  // This breaks the watch: currentState = reactive(loadedSettings.currentState);

  for (const key in loadedSettings.currentState) {
    currentState[key] = loadedSettings.currentState[key];
  }

  
  if(!recentlyLoadedPaths.value.includes(currentProjectPath.value)) {
    recentlyLoadedPaths.value.push(currentProjectPath.value);
    localStorage.setItem('recentlyLoadedPaths', JSON.stringify(recentlyLoadedPaths.value));
  }
  localStorage.setItem('currentProjectPath', currentProjectPath.value);
}

// Function to save settings
export async function saveSettings() : Promise<boolean> {
  var val = { ...settings }; 
  val.currentState = {...currentState }; 
  val.variables = JSON.stringify({... getDesignVariablesStore().allVariables });
  return await window.settings.save(currentProjectPath.value + '/settings.json', val);
}

export async function saveCurrentProjectPath() {
  localStorage.setItem('currentProjectPath', currentProjectPath.value);
}