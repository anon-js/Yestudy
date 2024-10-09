import styled from 'styled-components/native';

export const Container = styled.View`
  flex-direction: row;
  padding: 24px;
  background-color: #fff;
  border-radius: 12px;
  border: 1px solid #eaeaea;
  align-items: center;
  justify-content: space-between;
`;

export const TitleWrap = styled.View`
  flex-direction: column;
  gap: 2px;
`;

export const Title = styled.Text`
  font-size: 20px;
  font-weight: 500;
  color: #444;
`;

export const DateTitle = styled.Text`
  font-size: 12px;
  color: #777;
`;

export const Checkbox = styled.TouchableOpacity`
  width: 28px;
  height: 28px;
  border-radius: 28px;
  align-items: center;
  justify-content: center;
  background-color: #eaeaea;
`;
