import React from 'react';
import Svg, { Path } from 'react-native-svg';

const TodoIcon = ({color, size = 24}: IconProps) => (
  <Svg width={size} height={size} viewBox="0 0 22 22" fill="none">
    <Path fillRule="evenodd" clipRule="evenodd"
      d="M11 22C17.0751 22 22 17.0751 22 11C22 4.92487 17.0751 0 11 0C4.92487 0 0 4.92487 0 11C0 17.0751 4.92487 22 11 22ZM16.7795 7.62639C17.1255 7.19588 17.0569 6.56644 16.6264 6.22049C16.1959 5.87455 15.5664 5.9431 15.2205 6.37361L9.53126 13.4535L6.74594 10.334C6.37811 9.92201 5.74595 9.88623 5.33398 10.2541C4.92201 10.6219 4.88623 11.254 5.25406 11.666L8.82549 15.666C9.02125 15.8853 9.30356 16.0073 9.5974 15.9997C9.89123 15.992 10.1668 15.8555 10.3509 15.6264L16.7795 7.62639Z"
      fill={color} />
  </Svg>

);

export default TodoIcon;
