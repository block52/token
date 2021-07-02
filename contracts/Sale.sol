// SPDX-License-Identifier: MIT
pragma solidity =0.8.6;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract Sale {

  uint256 private immutable _deployed;
  address private immutable _token;

  AggregatorV3Interface public ETH_USD;

  constructor(address token, address eth_usd) {
    require(token != address(0) && eth_usd != address(0));
    _deployed = block.timestamp;
    _token = token;
    ETH_USD = AggregatorV3Interface(eth_usd);
    // kovan 0x9326BFA02ADD2366b30bacB125260Af641031331
    //0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
  }

  function buy() payable external {
    require(msg.value > 0, "Need to send more ETH");
    IERC20 token = IERC20(_token);
    
    uint256 amount = msg.value;
    (, int256 ethPrice, , , ) = ETH_USD.latestRoundData();
    uint256 usd_amount = amount / uint256(ethPrice);
    require(token.balanceOf(address(this)) > usd_amount, "Not enough tokens");
    token.transferFrom(address(this), msg.sender, usd_amount);
  }
}