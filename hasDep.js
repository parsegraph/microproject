const {readFileSync} = require("fs");

module.exports = (package, depType)=>{
  const packageJson = JSON.parse(readFileSync("./package.json"));
  const deps = packageJson[depType];
  if (!deps) {
    return false;
  }

  return deps[package] || deps["parsegraph-" + package];
}
