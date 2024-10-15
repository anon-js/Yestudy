import Svg, {Path} from 'react-native-svg';

const StopIcon = ({color, size = 24}: IconProps) => (
  <Svg width={size} height={size} viewBox="0 0 24 24" fill="none">
    <Path
      d="M5 4H19C19.5523 4 20 4.44772 20 5V19C20 19.5523 19.5523 20 19 20H5C4.44772 20 4 19.5523 4 19V5C4 4.44772 4.44772 4 5 4Z"
      fill={color}
      stroke={color}
      stroke-width={2}
    />
  </Svg>
);

export default StopIcon;
