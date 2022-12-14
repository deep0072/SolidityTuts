// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

import "@openzeppelin/contracts/access/Ownable.sol";

contract ICO  is ERC20 , Ownable {
    constructor(uint256 initialSupply) ERC20("DeepCoin", "DC") {
        // ERC20() initiating parent constructor with name and symbol of coin
        _mint(msg.sender, initialSupply); // create new token using _mint() function
    }

    function mint(address account, uint256 amount) public onlyOwner returns(bool){
        require(account != address(this) && amount != uint256(0), "mint invalid");
        _mint(account, amount);
        return true;
    }

    function Burn(address _add, uint _amt) public onlyOwner returns(bool){
        require (_add != address(this) && _amt != uint256(0), "mint invalid");
        _burn(_add,_amt);
    }

    function withDraw(uint256 _amt) public onlyOwner returns(bool){
        require(_amt <= address(this).balance, "ICO , withdraw is not available");
        payable(_msgSender()).transfer(_amt);
    }
}




