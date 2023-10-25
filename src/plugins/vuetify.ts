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
                    primary: '#79000e',
                    'primary-variant': '#891F2B',
                    secondary: '#00796B',
                    'secondary-variant': '#1F897D',
                    error: 'b00020',
                    "on-primary": '#ffffff',
                    "on-secondary": '#ffffff',
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
