import styled from 'styled-components/native';

export const IconView = styled.View`
  align-items: center;
  justify-content: center;
`;

export const IconLabel = styled.Text<{focused: boolean}>`
  font-size: 12px;
  ${props => `
    color: ${props.focused ? '#469ddd' : '#aabdc8'};
    font-weight: ${props.focused ? 'bold' : 'normal'};
  `}
`;
