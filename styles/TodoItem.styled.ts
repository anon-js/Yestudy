import styled from 'styled-components/native';

export const TitleWrap = styled.View`
  flex-direction: column;
  gap: 2px;
`;

export const Title = styled.Text`
  font-size: 20px;
  font-weight: 500;
  color: ${({ theme }) => theme.color.gray800};
`;

export const DateTitle = styled.Text`
  font-size: 12px;
  color: ${({ theme }) => theme.color.gray600};
`;

export const Checkbox = styled.TouchableOpacity`
  width: 28px;
  height: 28px;
  border-radius: 28px;
  align-items: center;
  justify-content: center;
  background-color: ${({ theme }) => theme.color.checkbox};
`;
