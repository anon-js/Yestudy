import styled from 'styled-components/native';

export const HomeworkItem = styled.View`
  gap: 4px;
  padding: 12px;
  background-color: ${({ theme }) => theme.color.gray100};
  border-radius: 8px;
  flex-direction: row;
  align-items: center;
  justify-content: space-between;
`;
