/**
 * plugins/vuetify.ts
 *
 * Framework documentation: https://vuetifyjs.com`
 */

// Styles
import '@mdi/font/css/materialdesignicons.css'
import 'vuetify/styles'

// Composables
import { createVuetify } from 'vuetify'
import { md3 } from 'vuetify/blueprints'

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
          surface: '#121212',
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
      }
    },
    defaultTheme: 'light',
  },
  blueprint: md3,
})
