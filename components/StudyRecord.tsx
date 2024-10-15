import {CPView} from '@styles/component.styled.ts';
import {RecordButton} from '@styles/StudyRecord.styled.ts';
import PlayIcon from '@components/icons/PlayIcon.tsx';
import {Body2, Headline3, Headline6} from '@styles/text.styled.ts';
import {useTheme} from 'styled-components/native';

interface Props {
  title: string;
  recordTime: string;
  description: string;
}

const StudyRecord = ({title, recordTime, description}: Props) => {
  const theme = useTheme();

  return (
    <CPView gap={8}>
      <Headline6>{title}</Headline6>
      <Headline3 color={theme.color.gray500} weight={900}>
        {recordTime}
      </Headline3>
      <Body2>{description}</Body2>
      <RecordButton>
        <PlayIcon color="#fff" />
      </RecordButton>
    </CPView>
  );
};

export default StudyRecord;
