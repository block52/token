// SPDX-License-Identifier: MIT
pragma solidity =0.8.6;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is IERC20, ERC20, Ownable {
  
  constructor(address hodler) ERC20("Block52", "B52") {
    _mint(hodler, 52000000000000000000000000);
  }
}