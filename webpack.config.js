const {DIST_NAME, webpackConfig, relDir} = require("./microproject");

module.exports = {
  entry: {
    index: relDir("src/index.ts"),
    demo: relDir("src/demo.ts")
  },
  ...webpackConfig(false),
  mode: "development",
  devtool: "eval-source-map",
};
