import styled from 'styled-components/native';

export const Title = styled.Text`
  font-size: 20px;
  font-weight: bold;
  color: ${({ theme }) => theme.color.gray800};
`;

export const Content = styled.Text`
  font-size: 16px;
  color: ${({ theme }) => theme.color.gray700};
`;

export const DateTitle = styled.Text`
  margin-top: 8px;
  font-size: 12px;
  color: ${({ theme }) => theme.color.gray600};
`;
