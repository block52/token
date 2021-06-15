// SPDX-License-Identifier: MIT
pragma solidity =0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract Sale {

  using SafeMath for uint256;
  uint256 private immutable _deployed;
  address private immutable _token;
  address private immutable _owner;
  address private immutable _eth_usd;

  constructor(address token, address owner, address eth_usd) {
    require(token != address(0) && owner != address(0) && eth_usd != address(0));
    _deployed = block.timestamp;
    _token = token;
    _owner = owner;
    _eth_usd = eth_usd;
    //0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
  }

  function buy() payable external {
    require(msg.value > 0, "Need to send more ETH");
    IERC20 token = IERC20(_token);
    uint256 amount = msg.value;
    token.transferFrom(_owner, msg.sender, amount);
  }
}