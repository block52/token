const Token = artifacts.require("Token");
const Sale = artifacts.require("Sale");

const {
  BN,
  expectEvent,
  expectRevert,
  time,
  constants: { ZERO_ADDRESS },
} = require("@openzeppelin/test-helpers");

const { expect } = require("chai");

contract("Sale", (accounts) => {
  let token;
  let sale;

  beforeEach(async () => {
    token = await Token.new();
    const instance = await token.deployed();
    console.log(instance.address);
    sale = await Sale.new(instance.address, "0x9326BFA02ADD2366b30bacB125260Af641031331");
  });

  describe("deployment", () => {
    it("should get standard ERC20 properties", async () => {

  });
});
