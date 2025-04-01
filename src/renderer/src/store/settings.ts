import { reactive, ref } from 'vue';
import { useDesignVariablesStore, DesignVariable} from "@/store/designVariables";

const designVariablesStore = useDesignVariablesStore();

export const settings = ref({
  });

export const currentProjectPath = ref(localStorage.getItem('currentProjectPath') || 'C:/git-projects/Vue/pacemaker/projects/lostForest');
export const recentlyLoadedPaths = ref(localStorage.getItem('recentlyLoadedPaths') ? JSON.parse(localStorage.getItem('recentlyLoadedPaths')!) : []);

currentProjectPath.value = localStorage.getItem('currentProjectPath') || currentProjectPath.value;


const savedState = localStorage.getItem('currentState');
const initialState = savedState ? JSON.parse(savedState) : {
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

export var currentState = reactive(initialState);

// Function to load settings
export async function loadSettings() {
  const loadedSettings = await window.settings.load(currentProjectPath.value + '/settings.json');
    if (!loadedSettings) {
        console.error('No settings found!');
        return;
    }
  const dv_raw = JSON.parse(loadedSettings.variables);
  const dv_arr: DesignVariable[] = Object.values(dv_raw);
  settings.value = loadedSettings;
  designVariablesStore.allVariables = dv_arr;

  currentState = loadedSettings.currentState || initialState;
  
  if(!recentlyLoadedPaths.value.includes(currentProjectPath.value)) {
    recentlyLoadedPaths.value.push(currentProjectPath.value);
    localStorage.setItem('recentlyLoadedPaths', JSON.stringify(recentlyLoadedPaths.value));
  }
  localStorage.setItem('currentProjectPath', currentProjectPath.value);
}

// Function to save settings
export async function saveSettings() : Promise<boolean> {
  var val = { ...settings.value }; 
  val.currentState = {...currentState }; 
  val.variables = JSON.stringify({... designVariablesStore.allVariables });
  return await window.settings.save(currentProjectPath.value + '/settings.json', val);
}

export async function saveCurrentProjectPath() {
  localStorage.setItem('currentProjectPath', currentProjectPath.value);
}