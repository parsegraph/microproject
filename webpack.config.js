const {DIST_NAME, webpackConfig, relDir} = require("./microproject");

module.exports = {
  entry: {
    lib: relDir("src/index.ts"),
    demo: relDir("src/demo.ts")
  },
  output: {
    path: relDir("dist"),
    filename: `parsegraph-${DIST_NAME}.[name].js`,
    globalObject: "this",
    library: `parsegraph_${DIST_NAME}`,
    libraryTarget: "umd",
  },
  ...webpackConfig(),
  mode: "development",
  devtool: "eval-source-map",
};
