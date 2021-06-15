const Token = artifacts.require("Token");
const Sale = artifacts.require("Sale");

module.exports = async function (deployer, accounts) {
  console.log(accounts[0]);
  await deployer.deploy(Token);
  
  console.log(Token);
  console.log(Token.address);
};
