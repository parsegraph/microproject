const {DIST_NAME, webpackConfig, relDir} = require("./microproject");

module.exports = {
  entry: relDir("src/index.ts"),
  output: {
    path: relDir("dist-prod"),
    filename: `parsegraph-${DIST_NAME}.js`,
    globalObject: "this",
    library: `parsegraph_${DIST_NAME}`,
    libraryTarget: "umd",
  },
  ...webpackConfig(["src/index.ts"]),
  mode: "production",
  devtool: false
};
