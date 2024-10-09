import {HeaderText, Logo, MainView} from '../styles/index.styled.ts';

const HomeScreen = () => {
  return (
    <MainView>
      <Logo
        source={require('../assets/logo.png')}
        resizeMode="contain"
      />
      <HeaderText>
        안녕하세요 👋{'\n'}
        만나서 반가워요!
      </HeaderText>
    </MainView>
  );
};

export default HomeScreen;
