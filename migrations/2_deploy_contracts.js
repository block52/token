const Token = artifacts.require("Token");
const Sale = artifacts.require("Sale");

module.exports = async (deployer, network, accounts) => {
  console.log(accounts[0]);
  console.log(network);

  if (network == "development") {
    await deployer.deploy(Token, accounts[0]);
    await token.transferOwnership(accounts[0]);
  }

  if (network == "main") {
    await deployer.deploy(Token, "0x9572E2a1DF6CE89a632dA4d29d6b48453F505e85");
  
    // console.log(Token);
    console.log(Token.address);
  
    // Transfer ownership to safe
    const token = await Token.deployed();
    console.log(token.address);
    await token.transferOwnership("0x9572E2a1DF6CE89a632dA4d29d6b48453F505e85"); 
  }

  if (network == "kovan") {
    const Metamask = "0xC29082511fEBc2185986d341ee8be3c9B2c66b66";
    await deployer.deploy(Token, Metamask);
    const token = await Token.deployed();
    console.log(token.address);

    await token.transferOwnership(Metamask);
    const ETH_USD = "0x9326BFA02ADD2366b30bacB125260Af641031331";
    await deployer.deploy(Sale, token.address, ETH_USD);
  }

  
  
  // ETH_USD main net 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
};
