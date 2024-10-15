import { DefaultTheme } from 'styled-components/native';

const dark: DefaultTheme = {
  color: {
    primary: '#009688',
    primaryVariant: '#005f56',
    white: '#2c2c2e',
    background: '#121212',
    disabledIcon: '#6e7d83',
    checkbox: '#515151',
    gray100: '#1f1f21',
    gray200: '#2c2c2e',
    gray300: '#3e3e40',
    gray400: '#5a5a60',
    gray500: '#7f7f87',
    gray600: '#a9a9b0',
    gray700: '#d1d1d6',
    gray800: '#eaeaea',
    gray900: '#f7f7f9',
  },
  fontSize: {
    xxs: '10px',
    xs: '12px',
    sm: '14px',
    md: '16px',
    lg: '20px',
    xl: '24px',
    xxl: '34px',
    huge: '48px',
    xhuge: '60px',
    xxhuge: '96px',
  },
};

const light: DefaultTheme = {
  ...dark,
  color: {
    primary: '#00bfa6',
    primaryVariant: '#00796b',
    white: '#ffffff',
    background: '#f0f0f3',
    disabledIcon: '#b0c4cc',
    checkbox: '#eaeaea',
    gray100: '#f7f7f9',
    gray200: '#eaeaea',
    gray300: '#d1d1d6',
    gray400: '#a9a9b0',
    gray500: '#7f7f87',
    gray600: '#5a5a60',
    gray700: '#3e3e40',
    gray800: '#2c2c2e',
    gray900: '#1f1f21',
  },
};

export { dark, light };
