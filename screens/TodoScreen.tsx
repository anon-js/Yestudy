import {HeaderText, ListView, ListWrapper, RenderItem, SafeAreaView} from '@styles/screen.styled.ts';
import React, {useMemo} from 'react';
import dayjs from 'dayjs';
import TodoItem from '@components/TodoItem.tsx';
import {ListRenderItem} from 'react-native';

interface ItemProps {
  id: number;
  title: string;
  endDate: string;
}

const TodoScreen = () => {
  const date = useMemo(() => dayjs().format('M월 D일'), []);

  const todos: ItemProps[] = useMemo(() => [
    {
      id: 1,
      title: '할 일 1',
      endDate: '10/7 12:00',
    },
  ], []);
  const renderItem: ListRenderItem<ItemProps> = ({item, index}) => {
    const isLastItem = index === todos.length - 1;

    return (
      <RenderItem isLastItem={isLastItem}>
        <TodoItem
          title={item.title}
          endDate={item.endDate}
        />
      </RenderItem>
    );
  };

  return (
    <SafeAreaView>
      <ListWrapper>
        <HeaderText>{date}</HeaderText>
        <ListView
          data={todos}
          renderItem={renderItem}
          keyExtractor={(item) => item.id.toString()}
        />
      </ListWrapper>
    </SafeAreaView>
  );
};

export default TodoScreen;
