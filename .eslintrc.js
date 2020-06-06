/* eslint-disable */

module.exports = {
  'plugins': ['jasmine'],
  'env': {
    'browser': true,
    'jasmine': true,
    'node': true,
    'es6': true
  },
  'extends': 'eslint:recommended',
  'extends': 'plugin:jasmine/recommended',
  'globals': {
    'Atomics': 'readonly',
    'SharedArrayBuffer': 'readonly'
  },
  'parser': 'babel-eslint',
  'parserOptions': {
    'ecmaVersion': 11,
    'sourceType': 'module'
  },
  'rules': {
    'indent': [
      'error',
      2
    ],
    'linebreak-style': [
      'error',
      'unix'
    ],
    'quotes': [
      'error',
      'backtick'
    ],
    'eol-last': [
      'error',
      'always'
    ],
    'semi': [
      'error',
      'always'
    ]
  }
};
