import styled from 'styled-components/native';

export const IconView = styled.View`
  align-items: center;
  justify-content: center;
`;

export const IconLabel = styled.Text<{focused: boolean}>`
  font-size: 12px;
  ${({focused, theme}) => `
    color: ${focused ? theme.color.primary : theme.color.disabledIcon};
    font-weight: ${focused ? 'bold' : 'normal'};
  `}
`;
