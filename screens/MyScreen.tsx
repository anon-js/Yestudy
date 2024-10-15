import {MainView, SafeAreaView} from '@styles/screen.styled.ts';
import {Headline5} from '@styles/text.styled.ts';

const MyScreen = () => {
  return (
    <SafeAreaView>
      <MainView>
        <Headline5>내 정보</Headline5>
      </MainView>
    </SafeAreaView>
  );
};

export default MyScreen;
