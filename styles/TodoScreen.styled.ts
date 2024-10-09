import styled from 'styled-components/native';
import {FlatList} from 'react-native';

export const Container = styled.View`
  flex: 1;
  padding: 64px 24px 24px 24px;
  background-color: #f5f5f7;
  gap: 32px;
`;

export const TodoList = (styled.FlatList`
  flex: 1;
  gap: 12px;
`as unknown) as typeof FlatList;

export const TodoItemView = styled.View<{isLastItem: boolean}>`
  margin-bottom: 12px;
`;
