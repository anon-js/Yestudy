import {HeaderText, ListView, ListWrapper, RenderItem, SafeAreaView} from '@styles/screen.styled.ts';
import {useMemo} from 'react';
import {ListRenderItem} from 'react-native';
import MemoItem from '@components/MemoItem.tsx';

interface ItemProps {
  id: number;
  title: string;
  content: string;
  lastDate: string;
}

const MemoScreen = () => {
  const memos: ItemProps[] = useMemo(() => [
    {
      id: 1,
      title: '제목',
      content: '내용',
      lastDate: '10/7 12:00',
    },
  ], []);
  const renderItem: ListRenderItem<ItemProps> = ({item, index}) => {
    const isLastItem = index === memos.length - 1;

    return (
      <RenderItem isLastItem={isLastItem}>
        <MemoItem
          title={item.title}
          content={item.content}
          lastDate={item.lastDate}
        />
      </RenderItem>
    );
  };

  return (
    <SafeAreaView>
      <ListWrapper>
        <HeaderText>
          기억해야 할 내용들을{'\n'}
          편하게 적어보세요!
        </HeaderText>
        <ListView
          data={memos}
          renderItem={renderItem}
          keyExtractor={(item) => item.id.toString()}
        />
      </ListWrapper>
    </SafeAreaView>
  );
};

export default MemoScreen;
