import styled from 'styled-components/native';

export const CPView = styled.View`
  padding: 16px;
  background-color: ${({ theme }) => theme.color.whiteBackground};
  border-radius: 12px;
  border: 1px solid ${({ theme }) => theme.color.gray300};
`;

export const ColumnItemView = styled.View`
  padding: 16px;
  background-color: ${({ theme }) => theme.color.whiteBackground};
  border-radius: 12px;
  border: 1px solid ${({ theme }) => theme.color.gray300};
  gap: 8px;
`;

export const RowItemView = styled.View`
  flex-direction: row;
  padding: 16px;
  background-color: ${({ theme }) => theme.color.whiteBackground};
  border-radius: 12px;
  border: 1px solid ${({ theme }) => theme.color.gray300};
  align-items: center;
  justify-content: space-between;
`;
