const {DIST_NAME, webpackConfig, relDir} = require("./microproject");

module.exports = {
  entry: {
    lib: relDir("src/index.ts"),
  },
  ...webpackConfig(true),
  mode: "production",
  devtool: false
};
