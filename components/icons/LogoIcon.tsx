import Svg, {Defs, LinearGradient, Path, Stop} from 'react-native-svg';
import {useTheme} from 'styled-components/native';

const LogoIcon = () => {
  const theme = useTheme();

  return (
    <Svg width={48} height={48} viewBox="0 0 1024 1024" fill="none">
      <Path
        d="M370.741 369.434C359.291 451.72 318.289 513.697 281.613 505.933C244.937 498.17 246.324 427.288 286.137 341.862C350.949 232.924 414.935 209.074 452.63 226.154C490.325 243.234 488.02 287.449 448.558 410.112C415.872 501.577 433.426 529.006 480.228 518.137C527.03 507.268 571.165 364.01 649.887 322.427M649.887 322.427C690.153 240.617 696.94 220.278 774.305 157M649.887 322.427L564.831 599.947C475.576 855.225 276.119 881.832 223.25 861.647C170.381 841.462 211.487 752.266 461.226 634.75C655.253 543.449 820 487.402 820 487.402"
        stroke="url(#paint0_linear_2524_471)"
        strokeWidth={64}
        strokeLinecap="round"
        strokeLinejoin="round"
      />
      <Defs>
        <LinearGradient
          id="paint0_linear_2524_471"
          x1={203.343}
          y1={512.261}
          x2={820.452}
          y2={512.261}
          gradientUnits="userSpaceOnUse">
          <Stop stopColor={theme.color.primary} />
          <Stop offset={1} stopColor={theme.color.primary} stopOpacity={0.5} />
        </LinearGradient>
      </Defs>
    </Svg>
  );
};

export default LogoIcon;
