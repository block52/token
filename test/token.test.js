const Token = artifacts.require("Token");

const {
  BN,
  expectEvent,
  expectRevert,
  time,
  constants: { ZERO_ADDRESS },
} = require("@openzeppelin/test-helpers");

const { expect } = require("chai");

contract("Token", (accounts) => {
  let token;

  beforeEach(async () => {
    token = await Token.new(accounts[0]);
    console.log(token.address);
  });

  describe("deployment", () => {
    it("should get standard ERC20 properties", async () => {
      const symbol = await token.symbol();
      expect(symbol).to.be.equal("B52");

      const name = await token.name();
      expect(name).to.be.equal("Block52");

      const decimals = new BN("18");
      const expected = new BN("52000000").mul(new BN("10").pow(decimals));

      const totalSupply = await token.totalSupply();
      expect(totalSupply).to.be.bignumber.equal(expected);
    });
  });
});
