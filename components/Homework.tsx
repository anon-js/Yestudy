import {CPView} from '@styles/component.styled.ts';
import {Body2, Headline6, Subtitle1} from '@styles/text.styled.ts';
import {HomeworkItem} from '@styles/HomeWork.styled.ts';
import {ColumnView} from '@styles/screen.styled.ts';

interface Props {
  title: string;
}

const Homework = ({title}: Props) => {
  return (
    <CPView gap={16}>
      <Headline6>{title}</Headline6>
      <ColumnView gap={8}>
        <HomeworkItem>
          <Subtitle1>수학 숙제</Subtitle1>
          <Body2>2021.08.30</Body2>
        </HomeworkItem>
        <HomeworkItem>
          <Subtitle1>수학 숙제</Subtitle1>
          <Body2>2021.08.30</Body2>
        </HomeworkItem>
        <HomeworkItem>
          <Subtitle1>수학 숙제</Subtitle1>
          <Body2>2021.08.30</Body2>
        </HomeworkItem>
      </ColumnView>
    </CPView>
  );
};

export default Homework;
