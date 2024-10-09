import {HeaderText, MainView, SafeAreaView} from '@styles/index.styled.ts';

const MyScreen = () => {
  return (
    <SafeAreaView>
      <MainView>
        <HeaderText>
          내 정보
        </HeaderText>
      </MainView>
    </SafeAreaView>
  );
};

export default MyScreen;
