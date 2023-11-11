const { expect } = require("chai");

describe("HelloWorld contract", function () {
  it("Should return the right greeting", async function () {
    const HelloWorld = await ethers.getContractFactory("HelloWorld");
    const helloWorld = await HelloWorld.deploy();
    await helloWorld.waitForDeployment();

    expect(await helloWorld.sayHello()).to.equal("Hello, Hardhat!");
  });
});
