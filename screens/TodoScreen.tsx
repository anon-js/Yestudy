import {HeaderText} from '../styles/index.styled.ts';
import React, {useMemo} from 'react';
import dayjs from 'dayjs';
import TodoItem from '../components/TodoItem.tsx';
import {Container, TodoItemView, TodoList} from '../styles/TodoScreen.styled.ts';
import {ListRenderItem} from 'react-native';

interface Item {
  id: number;
  title: string;
  endDate: string;
}

const TodoScreen = () => {
  const date = useMemo(() => dayjs().format('M월 D일'), []);

  const todos: Item[] = useMemo(() => [
    {
      id: 1,
      title: '할 일 1',
      endDate: '10/7 12:00',
    },
    {
      id: 2,
      title: '할 일 2',
      endDate: '10/7 12:00',
    },
    {
      id: 3,
      title: '할 일 3',
      endDate: '10/7 12:00',
    },
  ], []);
  const renderItem: ListRenderItem<Item> = ({item, index}) => {
    const isLastItem = index === todos.length - 1;

    return (
      <TodoItemView isLastItem={isLastItem}>
        <TodoItem
          title={item.title}
          endDate={item.endDate}
        />
      </TodoItemView>
    );
  };

  return (
    <Container>
      <HeaderText>{date}</HeaderText>
      <TodoList
        data={todos}
        renderItem={renderItem}
      />
    </Container>
  );
};

export default TodoScreen;
