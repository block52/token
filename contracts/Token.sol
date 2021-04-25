// SPDX-License-Identifier: MIT
pragma solidity =0.7.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is Ownable {

  constructor() ERC20("Block52", "B52") {
    _mint(52000, msg.sender);
  }
}