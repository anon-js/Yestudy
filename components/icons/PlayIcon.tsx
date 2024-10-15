import Svg, {Path} from 'react-native-svg';

const PlayIcon = ({color, size = 24}: IconProps) => (
  <Svg width={size} height={size} viewBox="0 0 24 24" fill="none">
    <Path
      d="M6.5145 3.9087L18.5708 11.1425C19.2182 11.5309 19.2182 12.4691 18.5708 12.8575L6.5145 20.0913C5.84797 20.4912 5 20.0111 5 19.2338V4.76619C5 3.9889 5.84797 3.50878 6.5145 3.9087Z"
      fill={color}
      stroke={color}
      stroke-width={2}
    />
  </Svg>
);

export default PlayIcon;
