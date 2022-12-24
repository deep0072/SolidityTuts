// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

import "@openzeppelin/contracts/access/Ownable.sol";

contract ICO  is ERC20 , Ownable {
    constructor() ERC20("DeepCoin", "DC") {
        // ERC20() initiating parent constructor with name and symbol of coin
        _mint(msg.sender, 1000000*(10**uint256(decimals()))); // create new token using _mint() function
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
        _transfer(owner(), _msgSender(), _amt);
    }

    // buy erc20 token using ether. in one ether we will get 1000 token
    function Buy() public payable returns(bool){
        require(msg.value <= address(this).balance && msg.value !=0, "not enough balance");

        uint amount = msg.value * 1000;

        _transfer(owner(), _msgSender(), amount);
        return (true);



    }




   
}




