const path = require("path");
const { execSync } = require("child_process");

const DIST_NAME = "TODO-PACKAGE-NAME";

const relDir = (...pathFrags)=>path.resolve(__dirname, ...pathFrags);

const hasShaderFiles = ()=>{
  const rv = execSync(`find ${relDir("src")} -type f -name '*.glsl'`);
  return rv.stdout && rv.stdout.trim().length > 0;
}

const webpackConfig = ()=>{
  const rules = [
    {
      test: /\.(js|ts|tsx?)$/,
      exclude: /node_modules/,
      use: ["babel-loader", "ts-loader"]
    },
  ];
  const extensions = [".js", ".ts", ".tsx"];

  if (hasShaderFiles()) {
    rules.push({
      test: /\.(glsl|vs|fs|vert|frag)$/,
      exclude: /node_modules/,
      use: ["ts-shader-loader"],
    });
    extensions.push(".glsl");
  }

  return {
    module: {
      rules
    },
    resolve: {
      extensions,
      modules: [relDir("src"), relDir("node_modules")]
    },
  };
};

module.exports = {
  DIST_NAME,
  relDir,
  webpackConfig
};
