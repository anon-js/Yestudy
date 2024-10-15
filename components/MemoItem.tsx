import {ColumnItemView} from '@styles/component.styled.ts';
import {Body1, Caption, Headline6} from '@styles/text.styled.ts';

interface Props {
  title: string;
  content: string;
  lastDate: string;
}

const MemoItem = ({title, content, lastDate}: Props) => {
  return (
    <ColumnItemView>
      <Headline6>{title}</Headline6>
      <Body1>{content}</Body1>
      <Caption>{lastDate}</Caption>
    </ColumnItemView>
  );
};

export default MemoItem;
