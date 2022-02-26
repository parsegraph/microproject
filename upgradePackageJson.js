const { readFileSync, writeFileSync } = require("fs");
const { spawnSync } = require("child_process");
const path = require("path");

const moduleRoot = ".";
const packageJsonPath = path.join(moduleRoot, "package.json");

const packageJsonHasChanges = ()=>{
  return !!spawnSync("git", ["diff", "--quiet", "package.json"]).status;
}

const updatePackageJson = (cb)=>{
  const packageJSON = JSON.parse(readFileSync(packageJsonPath));
  cb(packageJSON);
  writeFileSync(packageJsonPath, JSON.stringify(packageJSON, null, "  ") + "\n");
}

const commitPackageJson = (msg)=> {
  if (spawnSync("git", ["diff", "--quiet", "package.json"]).status) {
    spawnSync("git", ["commit", "package.json", "-m", msg]);
  }
}

module.exports = {
  packageJsonHasChanges,
  updatePackageJson,
  commitPackageJson
}
