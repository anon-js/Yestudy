import styled from 'styled-components/native';
import {SafeAreaView as RNSafeAreaView} from 'react-native-safe-area-context';
import {FlatList} from 'react-native';

export const SafeAreaView = styled(RNSafeAreaView)`
  flex: 1;
  background-color: ${({ theme }) => theme.color.background};
`;

export const MainView = styled.View`
  flex: 1;
  background-color: ${({ theme }) => theme.color.background};
  padding: 16px;
  gap: 16px;
`;

export const ColumnView = styled.View<{gap?: number}>`
  gap: ${({gap}) => gap || 8}px;
`;

export const ListWrapper = styled.View`
  flex: 1;
  padding: 16px;
  background-color: ${({ theme }) => theme.color.background};
  gap: 16px;
`;

export const ListView = (styled.FlatList`
  flex: 1;
  gap: 12px;
`as unknown) as typeof FlatList;

export const RenderItem = styled.View<{isLastItem: boolean}>`
  margin-bottom: ${({isLastItem}) => (isLastItem ? 24 : 12)}px;
`;
