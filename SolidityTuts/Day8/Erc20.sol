// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Erc20Token is ERC20 {
    constructor(uint256 initialSupply) ERC20("DeepCoin", "DC") {
        // ERC20() initiating parent constructor with name and symbol of coin
        _mint(msg.sender, initialSupply); // create new token using _mint() function
    }
}
