import {HeaderText, MainView, SafeAreaView} from '@styles/screen.styled.ts';

const CalendarScreen = () => {
  return (
    <SafeAreaView>
      <MainView>
        <HeaderText>
          일정
        </HeaderText>
      </MainView>
    </SafeAreaView>
  );
};

export default CalendarScreen;
