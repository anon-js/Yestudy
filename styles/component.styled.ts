import styled from 'styled-components/native';

export const CPView = styled.View<{gap?: number}>`
  padding: 12px;
  background-color: ${({ theme }) => theme.color.white};
  border-radius: 12px;
  border: 1px solid ${({ theme }) => theme.color.gray300};
  gap: ${({gap}) => gap || 8}px;
`;

export const ColumnItemView = styled.View`
  padding: 12px;
  background-color: ${({ theme }) => theme.color.white};
  border-radius: 12px;
  border: 1px solid ${({ theme }) => theme.color.gray300};
  gap: 8px;
`;

export const RowItemView = styled.View`
  flex-direction: row;
  padding: 12px;
  background-color: ${({ theme }) => theme.color.white};
  border-radius: 12px;
  border: 1px solid ${({ theme }) => theme.color.gray300};
  align-items: center;
  justify-content: space-between;
`;

export const TitleColumnWrap = styled.View`
  gap: 4px;
`;

export const Checkbox = styled.TouchableOpacity`
  width: 28px;
  height: 28px;
  border-radius: 28px;
  align-items: center;
  justify-content: center;
  background-color: ${({ theme }) => theme.color.checkbox};
`;
