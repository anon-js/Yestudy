import styled from 'styled-components/native';

export const RecordButton = styled.TouchableOpacity`
  margin-top: 8px;
  width: 100%;
  height: 48px;
  background-color: ${({theme}) => theme.color.primary};
  border-radius: 12px;
  align-items: center;
  justify-content: center;
`;
