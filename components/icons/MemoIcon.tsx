import React from 'react';
import Svg, { Path } from 'react-native-svg';

const MemoIcon = ({color, size = 24}: IconProps) => (
  <Svg width={size} height={size} viewBox="0 0 20 22" fill="none">
    <Path fillRule="evenodd" clipRule="evenodd"
          d="M4 0C1.79086 0 0 1.79086 0 4V18C0 20.2091 1.79086 22 4 22H16C18.2091 22 20 20.2091 20 18V4C20 1.79086 18.2091 0 16 0H4ZM4 6C3.44772 6 3 6.44772 3 7C3 7.55228 3.44772 8 4 8H12C12.5523 8 13 7.55228 13 7C13 6.44772 12.5523 6 12 6H4ZM3 11C3 10.4477 3.44772 10 4 10H16C16.5523 10 17 10.4477 17 11C17 11.5523 16.5523 12 16 12H4C3.44772 12 3 11.5523 3 11ZM4 14C3.44772 14 3 14.4477 3 15C3 15.5523 3.44772 16 4 16H14C14.5523 16 15 15.5523 15 15C15 14.4477 14.5523 14 14 14H4Z"
          fill={color} />
  </Svg>

);

export default MemoIcon;
