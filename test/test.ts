import { assert } from "chai";
import todo from "../dist/parsegraph-TODO-PACKAGE-NAME.lib";

describe("Package", function () {
  it("works", () => {
    assert.equal(typeof todo(), "string");
    console.log(todo());
    assert.isTrue(todo().indexOf("Hello") >= 0);
  });
});
