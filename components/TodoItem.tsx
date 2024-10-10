import {RowItemView} from '@styles/component.styled.ts';
import {TitleWrap, Title, DateTitle, Checkbox} from '@styles/TodoItem.styled.ts';

export interface ItemProps {
  title: string;
  endDate: string;
}

const TodoItem = ({title, endDate}: ItemProps) => {
  return (
    <RowItemView>
      <TitleWrap>
        <Title>{title}</Title>
        <DateTitle>~ {endDate}</DateTitle>
      </TitleWrap>
      <Checkbox />
    </RowItemView>
  );
};

export default TodoItem;
