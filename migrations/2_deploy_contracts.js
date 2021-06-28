const Token = artifacts.require("Token");

module.exports = async (deployer, accounts) => {
  console.log(accounts[0]);
  await deployer.deploy(Token);
  
  console.log(Token);
  console.log(Token.address);

  // Transfer ownership to safe
  const token = await Token.deployed();
  await token.transferOwnership("0x9572E2a1DF6CE89a632dA4d29d6b48453F505e85");  
};
