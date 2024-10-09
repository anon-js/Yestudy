import {Checkbox, Container, DateTitle, Title, TitleWrap} from '../styles/TodoItem.styled.ts';

export interface ItemProps {
  title: string;
  endDate: string;
}

const TodoItem = ({title, endDate}: ItemProps) => {
  return (
    <Container>
      <TitleWrap>
        <Title>{title}</Title>
        <DateTitle>~ {endDate}</DateTitle>
      </TitleWrap>
      <Checkbox />
    </Container>
  );
};

export default TodoItem;
