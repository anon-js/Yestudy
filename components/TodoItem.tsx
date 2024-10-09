import {ItemView, TitleWrap, Title, DateTitle, Checkbox} from '@styles/TodoItem.styled.ts';

export interface ItemProps {
  title: string;
  endDate: string;
}

const TodoItem = ({title, endDate}: ItemProps) => {
  return (
    <ItemView>
      <TitleWrap>
        <Title>{title}</Title>
        <DateTitle>~ {endDate}</DateTitle>
      </TitleWrap>
      <Checkbox />
    </ItemView>
  );
};

export default TodoItem;
