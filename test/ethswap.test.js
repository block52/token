const Token = artifacts.require("Token");
const ETHSwap = artifacts.require("ETHSwap");
const Mock = artifacts.require("MockUSDETH");

const {
  BN,
  expectEvent,
  expectRevert,
  time,
  constants: { ZERO_ADDRESS },
} = require("@openzeppelin/test-helpers");

const { expect } = require("chai");

contract("ETHSwap", (accounts) => {
  let token;
  let swap;
  let mock;

  beforeEach(async () => {
    // deploy b52 token
    token = await Token.new(accounts[0]);
    console.log(token.address);

    // deploy chainlink mock
    mock = await Mock.new();
    console.log(mock.address);

    // deploy swap contract
    swap = await ETHSwap.new(token.address, mock.address);

    await token.transfer(swap.address, 100000, { from: accounts[0] });
    expect(await token.balanceOf(swap.address)).to.be.bignumber.equal(new BN("100000"));
  });

  describe.only("Swaps", () => {
    it("should swap tokens for ETH", async () => {
      expect(await swap.quote()).to.be.bignumber.equal(new BN("3000"));
      await swap.send(10, {from: accounts[0]});
      
    });
  });
});
