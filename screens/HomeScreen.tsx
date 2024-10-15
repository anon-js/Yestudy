import {ColumnView, MainView, SafeAreaView} from '@styles/screen.styled.ts';
import StudyRecord from '@components/StudyRecord.tsx';
import Homework from '@components/Homework.tsx';
import LogoIcon from '@components/icons/LogoIcon.tsx';

const HomeScreen = () => {
  return (
    <SafeAreaView>
      <MainView>
        <LogoIcon />
        <ColumnView gap={12}>
          <StudyRecord
            title="최근 공부한 기록이 없어요"
            recordTime={'00:00:00"00'}
            description={
              '지금 공부를 하고 계시다면\n재생 버튼을 눌러 기록해보세요!'
            }
          />
          <Homework title="남은 숙제가 있어요" />
        </ColumnView>
      </MainView>
    </SafeAreaView>
  );
};

export default HomeScreen;
