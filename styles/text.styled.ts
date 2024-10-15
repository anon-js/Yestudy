import styled from 'styled-components/native';

// Subtitle 1, Subtitle 2, Body 1, Body 2, Button, Caption, Overline
export const Headline1 = styled.Text<TextProps>`
  font-size: ${({theme}) => theme.fontSize.xxhuge};
  font-weight: ${({weight}) => weight || 300};
  color: ${({theme, color}) => color || theme.color.gray900};
`;

export const Headline2 = styled.Text<TextProps>`
  font-size: ${({theme}) => theme.fontSize.xhuge};
  font-weight: ${({weight}) => weight || 300};
  color: ${({theme, color}) => color || theme.color.gray900};
`;

export const Headline3 = styled.Text<TextProps>`
  font-size: ${({theme}) => theme.fontSize.huge};
  font-weight: ${({weight}) => weight || 'normal'};
  color: ${({theme, color}) => color || theme.color.gray900};
`;

export const Headline4 = styled.Text<TextProps>`
  font-size: ${({theme}) => theme.fontSize.xxl};
  font-weight: ${({weight}) => weight || 'normal'};
  color: ${({theme, color}) => color || theme.color.gray900};
`;

export const Headline5 = styled.Text<TextProps>`
  font-size: ${({theme}) => theme.fontSize.xl};
  font-weight: ${({weight}) => weight || 'bold'};
  color: ${({theme, color}) => color || theme.color.gray900};
`;

export const Headline6 = styled.Text<TextProps>`
  font-size: ${({theme}) => theme.fontSize.lg};
  font-weight: ${({weight}) => weight || 'bold'};
  color: ${({theme, color}) => color || theme.color.gray900};
`;

export const Subtitle1 = styled.Text<TextProps>`
  font-size: ${({theme}) => theme.fontSize.md};
  font-weight: ${({weight}) => weight || 'normal'};
  color: ${({theme, color}) => color || theme.color.gray900};
`;

export const Subtitle2 = styled.Text<TextProps>`
  font-size: ${({theme}) => theme.fontSize.sm};
  font-weight: ${({weight}) => weight || 500};
  color: ${({theme, color}) => color || theme.color.gray900};
`;

export const Body1 = styled.Text<TextProps>`
  font-size: ${({theme}) => theme.fontSize.md};
  font-weight: ${({weight}) => weight || 'normal'};
  color: ${({theme, color}) => color || theme.color.gray900};
`;

export const Body2 = styled.Text<TextProps>`
  font-size: ${({theme}) => theme.fontSize.sm};
  font-weight: ${({weight}) => weight || 'normal'};
  color: ${({theme, color}) => color || theme.color.gray900};
`;

export const Button = styled.Text<TextProps>`
  font-size: ${({theme}) => theme.fontSize.sm};
  font-weight: ${({weight}) => weight || 500};
  color: ${({theme, color}) => color || theme.color.gray900};
`;

export const Caption = styled.Text<TextProps>`
  font-size: ${({theme}) => theme.fontSize.xs};
  font-weight: ${({weight}) => weight || 'normal'};
  color: ${({theme, color}) => color || theme.color.gray900};
`;

export const Overline = styled.Text<TextProps>`
  font-size: ${({theme}) => theme.fontSize.xxs};
  font-weight: ${({weight}) => weight || 'normal'};
  color: ${({theme, color}) => color || theme.color.gray900};
`;
