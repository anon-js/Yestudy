import Svg from 'react-native-svg';
import {IconPath} from '@styles/tabs.styled.ts';

const MyIcon = ({focused, size = 24}: BottomTabIconProps) => (
  <Svg width={size} height={size} viewBox="0 0 20 22" fill="none">
    <IconPath
      focused={focused}
      fillRule="evenodd"
      clipRule="evenodd"
      strokeWidth={0}
      d="M10 10C12.7614 10 15 7.76142 15 5C15 2.23858 12.7614 0 10 0C7.23858 0 5 2.23858 5 5C5 7.76142 7.23858 10 10 10ZM0 20.4211C0 18.3158 2 12 10 12C18 12 20 18.3158 20 20.4211C20 22.5263 0 22.5263 0 20.4211Z"
    />
  </Svg>
);

export default MyIcon;
