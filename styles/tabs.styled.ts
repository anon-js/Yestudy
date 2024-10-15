import styled from 'styled-components/native';
import {Path} from 'react-native-svg';

export const IconView = styled.View`
  align-items: center;
  justify-content: center;
`;

export const IconPath = styled(Path)<{focused?: boolean}>`
  ${({focused = false, theme}) => `
    fill: ${focused ? theme.color.primary : theme.color.disabledIcon};
    stroke: ${focused ? theme.color.primary : theme.color.disabledIcon};
  `}
`;

export const IconLabel = styled.Text<{focused?: boolean}>`
  font-size: ${({ theme }) => theme.fontSize.small};
  ${({focused = false, theme}) => `
    color: ${focused ? theme.color.primary : theme.color.disabledIcon};
    font-weight: ${focused ? 'bold' : 'normal'};
  `}
`;
