import Svg from 'react-native-svg';
import {IconPath} from '@styles/tabs.styled.ts';

const CalendarIcon = ({focused, size = 24}: BottomTabIconProps) => (
  <Svg width={size} height={size} viewBox="0 0 22 23" fill="none">
    <IconPath
      focused={focused}
      fillRule="evenodd"
      clipRule="evenodd"
      strokeWidth={0}
      d="M4 1C4 0.447715 4.44772 0 5 0C5.55228 0 6 0.447715 6 1V3H4V1ZM18 3C20.2091 3 22 4.79086 22 7V8H0V7C0 4.79086 1.79086 3 4 3V5C4 5.55228 4.44772 6 5 6C5.55228 6 6 5.55228 6 5V3H16V5C16 5.55228 16.4477 6 17 6C17.5523 6 18 5.55228 18 5V3ZM18 3V1C18 0.447715 17.5523 0 17 0C16.4477 0 16 0.447715 16 1V3H18ZM22 10H0V19C0 21.2091 1.79086 23 4 23H18C20.2091 23 22 21.2091 22 19V10Z"
    />
  </Svg>
);

export default CalendarIcon;
