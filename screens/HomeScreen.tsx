import {HeaderText, MainView, SafeAreaView} from '@styles/screen.styled.ts';

const HomeScreen = () => {
  return (
    <SafeAreaView>
      <MainView>
        <HeaderText>
          안녕하세요 👋{'\n'}
          만나서 반가워요!
        </HeaderText>
      </MainView>
    </SafeAreaView>
  );
};

export default HomeScreen;
