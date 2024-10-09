import styled from 'styled-components/native';
import {SafeAreaView as RNSafeAreaView} from 'react-native-safe-area-context';
import {FlatList} from 'react-native';

export const SafeAreaView = styled(RNSafeAreaView)`
  flex: 1;
  padding-bottom: 45px;
`;

export const MainView = styled.View`
  flex: 1;
  background-color: #f5f5f7;
  padding: 20px 24px;
`;

export const ListWrapper = styled.View`
  flex: 1;
  padding: 20px 24px;
  background-color: #f5f5f7;
  gap: 32px;
`;

export const ListView = (styled.FlatList`
  flex: 1;
  gap: 12px;
`as unknown) as typeof FlatList;

export const RenderItem = styled.View<{isLastItem: boolean}>`
  margin-bottom: ${({isLastItem}) => (isLastItem ? 24 : 12)}px;
`;

export const HeaderText = styled.Text`
  font-size: 24px;
  font-weight: bold;
  color: #1d1d1f;
  line-height: 130%;
`;
