module.exports = {
  root: true,
  env: {
    es6: true,
    node: true,
  },
  extends: ["eslint:recommended", "google"],
  rules: {
    quotes: ["error", "double"],
    indent: "off",
    "jsdoc/require-jsdoc": 1,
  },
  plugins: ["jsdoc"],
  extends: ["plugin:jsdoc/recommended"],
  parserOptions: {
    ecmaVersion: 12,
  },
};
