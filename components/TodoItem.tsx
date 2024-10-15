import {
  Checkbox,
  RowItemView,
  TitleColumnWrap,
} from '@styles/component.styled.ts';
import {Caption, Subtitle1} from '@styles/text.styled.ts';

export interface ItemProps {
  title: string;
  endDate: string;
}

const TodoItem = ({title, endDate}: ItemProps) => {
  return (
    <RowItemView>
      <TitleColumnWrap>
        <Subtitle1>{title}</Subtitle1>
        <Caption>~ {endDate}</Caption>
      </TitleColumnWrap>
      <Checkbox />
    </RowItemView>
  );
};

export default TodoItem;
