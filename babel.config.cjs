module.exports = {
  presets: ['module:@react-native/babel-preset'],
  plugins: [
    [
      'module-resolver',
      {
        root: ['.'],
        extensions: ['.ios.js', '.android.js', '.js', '.ts', '.tsx', '.json'],
        alias: {
          tests: ['./tests/'],
          '@components': './components',
          '@screens': './screens',
          '@styles': './styles',
          '@navigation': './navigation',
          '@theme': './theme',
        },
      },
    ],
  ],
};
