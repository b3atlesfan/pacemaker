/**
 * plugins/vuetify.ts
 *
 * Framework documentation: https://vuetifyjs.com`
 */

// Styles
import '@mdi/font/css/materialdesignicons.css'
import 'vuetify/styles'

// Composables
import {createVuetify} from 'vuetify'
import {md3} from 'vuetify/blueprints'

// https://vuetifyjs.com/en/introduction/why-vuetify/#feature-guides
export default createVuetify({
  theme: {
    themes: {
      myCustomTheme: {
        colors: {
          background: '#f5f5f5',
          surface: '#ffffff',
          primary: '#7986CB',
          secondary: '#cb7987',
          'primary-alternative': '#283593',
          //success: '#dd0d52',
          //warning: '#dd0d52',
          //error: '#dd0d52',
          //info: '#dd0d52',
          //"on-background": '#dd0d52',
          //"on-surface": '#dd0d52',
          "on-primary": '#202020',
          "on-secondary": '#202020',
          //"on-success": '#dd0d52',
          //"on-warning": '#dd0d52',
          //"on-error": '#dd0d52',
          //"on-info": '#dd0d52',
          //"primary-50": '#fde4ea'
        },
      },
      materialCustomThemeDark: {
        dark: true,
        colors: {
          background: '#121212',
          surface: '#555555',
          primary: '#bb86fc',
          'primary-variant': '#3700b3',
          secondary: '#03dac6',
          error: '#cf6679',
          "on-primary": '#000000',
          "on-secondary": '#000000',
          "on-background": '#ffffff',
          "on-surface": '#ffffff',
          "on-error": '#000000',
        }
      },
      materialCustomThemeLight: {
        dark: false,
        colors: {
          background: '#fdffe8',
          surface: '#ffffff',
          primary: '#6053ff',
          'primary-variant': '#3700b3',
          secondary: '#03dac6',
          error: 'b00020',
          "on-primary": '#ffffff',
          "on-secondary": '#000000',
          "on-background": '#000000',
          "on-surface": '#000000',
          "on-error": '#ffffff',
        }
      },
      blueGray: {
        dark: true,
        colors: {
          background: '#cfd8dc',
          surface: '#ECEFF1',
          primary: '#604059',
          'primary-variant': '#3700b3',
          secondary: '#ECEFF1',
          error: 'b00020',
          "on-primary": '#eee7eb',
          "on-secondary": '#263238',
          "on-background": '#263238',
          "on-surface": '#263238',
          "on-error": '#ECEFF1',
        }
      },
      blueGrayLight: {
        dark: false,
        colors: {
          background: '#cfd8dc',
          surface: '#ECEFF1',
          primary: '#604059',
          'primary-variant': '#3700b3',
          secondary: '#4e9d71',
          error: 'b00020',
          "on-primary": '#eee7eb',
          "on-secondary": '#ECEFF1',
          "on-background": '#263238',
          "on-surface": '#263238',
          "on-error": '#ECEFF1',
        }
      },
      red: {
        dark: false,
        colors: {
          background: '#FAFAFA',
          surface: '#ffffff',
          'primary-900': '#3f0007',
          'primary-800': '#4d0009',
          'primary-700': '#5c000b',
          'primary-600': '#6a000c',
          primary: '#79000e',
          'primary-400': '#891f2b',
          'primary-300': '#993d48',
          'primary-200': '#a95c65',
          'primary-100': '#b97a82',
          'primary-50': '#c9999f',
          'on-primary-900': '#ffffff',
          'on-primary-800': '#ffffff',
          'on-primary-700': '#ffffff',
          'on-primary-600': '#ffffff',
          "on-primary": '#ffffff',
          'on-primary-400': '#ffffff',
          'on-primary-300': '#ffffff',
          'on-primary-200': '#ffffff',
          'on-primary-100': '#000000',
          'on-primary-50': '#000000',
          'secondary-900': '#003f38',
          'secondary-800': '#004d44',
          'secondary-700': '#005c51',
          'secondary-600': '#006a5e',
          secondary: '#00796B',
          'secondary-400': '#1f897d',
          'secondary-300': '#3d998f',
          'secondary-200': '#5ca9a0',
          'secondary-100': '#7ab9b2',
          'secondary-50': '#99c9c4',
          'on-secondary-900': '#ffffff',
          'on-secondary-800': '#ffffff',
          'on-secondary-700': '#ffffff',
          'on-secondary-600': '#ffffff',
          "on-secondary": '#ffffff',
          'on-secondary-400': '#ffffff',
          'on-secondary-300': '#ffffff',
          'on-secondary-200': '#ffffff',
          'on-secondary-100': '#000000',
          'on-secondary-50': '#000000',
          error: 'b00020',
          "on-background": '#000000',
          "on-surface": '#000000',
          "on-error": '#ECEFF1',
        }
      },
      redDark: {
        dark: true,
        colors: {
          background: '#121212',
          surface: '#555555',
          primary: '#bb86fc',
          'primary-variant': '#3700b3',
          secondary: '#03dac6',
          'secondary-variant': '#1F897D',
          error: '#cf6679',
          "on-primary": '#000000',
          "on-secondary": '#000000',
          "on-background": '#ffffff',
          "on-surface": '#ffffff',
          "on-error": '#000000',
        }
      }
    },
    defaultTheme: 'red',
  },
  blueprint: md3,
})
