import {DateTitle, Content, Title} from '@styles/MemoItem.styled.ts';
import {ColumnItemView} from '@styles/component.styled.ts';

interface Props {
  title: string;
  content: string;
  lastDate: string;
}

const MemoItem = ({title, content, lastDate}: Props) => {
  return (
    <ColumnItemView>
      <Title>{title}</Title>
      <Content>{content}</Content>
      <DateTitle>{lastDate}</DateTitle>
    </ColumnItemView>
  );
};

export default MemoItem;
