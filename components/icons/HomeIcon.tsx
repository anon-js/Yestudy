import React from 'react';
import Svg, { Path } from 'react-native-svg';

const HomeIcon = ({color, size = 24}: IconProps) => (
  <Svg width={size} height={size} viewBox="0 0 24 22" fill="none">
    <Path
      d="M1 9.57143V21H6.86667C6.86667 21 6.30509 12.4286 12 12.4286C17.6949 12.4286 17 21 17 21H23V9.57143C23 7.42857 14.2 1 12 1C9.8 1 1 7.78571 1 9.57143Z"
      fill={color} stroke={color} stroke-width={2} strokeLinecap="round" strokeLinejoin="round" />
  </Svg>

);

export default HomeIcon;
