import {MainView, SafeAreaView} from '@styles/screen.styled.ts';
import {Headline5} from '@styles/text.styled.ts';

const CalendarScreen = () => {
  return (
    <SafeAreaView>
      <MainView>
        <Headline5>일정</Headline5>
      </MainView>
    </SafeAreaView>
  );
};

export default CalendarScreen;
