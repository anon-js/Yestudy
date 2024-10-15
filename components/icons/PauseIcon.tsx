import Svg, {Path} from 'react-native-svg';

const StopIcon = ({color, size = 24}: IconProps) => (
  <Svg width={size} height={size} viewBox="0 0 24 24" fill="none">
    <Path
      d="M6 4H8C8.55228 4 9 4.44772 9 5V19C9 19.5523 8.55228 20 8 20H6C5.44772 20 5 19.5523 5 19V5C5 4.44772 5.44772 4 6 4Z"
      fill={color}
      stroke={color}
      stroke-width={2}
    />
    <Path
      d="M16 4H18C18.5523 4 19 4.44772 19 5V19C19 19.5523 18.5523 20 18 20H16C15.4477 20 15 19.5523 15 19V5C15 4.44772 15.4477 4 16 4Z"
      fill={color}
      stroke={color}
      stroke-width={2}
    />
  </Svg>
);

export default StopIcon;
