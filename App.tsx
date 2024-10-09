import {useEffect} from 'react';
import { NavigationContainer } from '@react-navigation/native';
import Tabs from '@navigation/tabs.tsx';
import SplashScreen from 'react-native-splash-screen';
import {SafeAreaProvider} from 'react-native-safe-area-context';

function App() {
  useEffect(() => {
    SplashScreen.hide();
  });

  return (
    <SafeAreaProvider>
      <NavigationContainer>
        <Tabs />
      </NavigationContainer>
    </SafeAreaProvider>
  );
}

export default App;
