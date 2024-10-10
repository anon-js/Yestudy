import {useEffect, useMemo} from 'react';
import { NavigationContainer } from '@react-navigation/native';
import Tabs from '@navigation/tabs.tsx';
import SplashScreen from 'react-native-splash-screen';
import {SafeAreaProvider} from 'react-native-safe-area-context';
import {ThemeProvider} from 'styled-components/native';
import {useDispatch, useSelector} from 'react-redux';
import {RootState} from './reducers';
import {dark, light} from './theme';
import {setTheme} from './reducers/themeSlice.ts';
import {Appearance, StatusBar} from 'react-native';

function App() {
  const theme = useSelector((state: RootState) => state.theme);
  const isDark = useMemo(() => theme === 'dark', [theme]);

  const dispatch = useDispatch();
  useEffect(() => {
    const subscription = Appearance.addChangeListener(({colorScheme}) => {
      dispatch(setTheme(colorScheme));
    });
    return () => subscription.remove();
  }, [dispatch]);

  useEffect(() => {
    SplashScreen.hide();
  });

  return (
    <SafeAreaProvider>
      <StatusBar barStyle={isDark ? 'light-content' : 'dark-content'} />
      <ThemeProvider theme={isDark ? dark : light}>
        <NavigationContainer>
          <Tabs />
        </NavigationContainer>
      </ThemeProvider>
    </SafeAreaProvider>
  );
}

export default App;
