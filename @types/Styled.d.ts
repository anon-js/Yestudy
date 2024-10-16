import 'styled-components/native';

declare module 'styled-components/native' {
  export interface DefaultTheme {
    color: {
      primary: string;
      primaryVariant: string;
      white: string;
      background: string;
      disabledIcon: string;
      checkbox: string;
      gray100: string;
      gray200: string;
      gray300: string;
      gray400: string;
      gray500: string;
      gray600: string;
      gray700: string;
      gray800: string;
      gray900: string;
    };
    fontSize: {
      xxs: string;
      xs: string;
      sm: string;
      md: string;
      lg: string;
      xl: string;
      xxl: string;
      huge: string;
      xhuge: string;
      xxhuge: string;
    };
  }
}
