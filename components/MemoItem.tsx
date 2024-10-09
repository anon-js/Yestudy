import {DateTitle, ItemView, Content, Title} from '@styles/MemoItem.styled.ts';

interface Props {
  title: string;
  content: string;
  lastDate: string;
}

const MemoItem = ({title, content, lastDate}: Props) => {
  return (
    <ItemView>
      <Title>{title}</Title>
      <Content>{content}</Content>
      <DateTitle>{lastDate}</DateTitle>
    </ItemView>
  );
};

export default MemoItem;
