// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.6;

//Payable makes sure that the function can send and receive Ether

contract PayableFunc {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    modifier CheckOwner() {
        require(msg.sender == owner, "you are not allowed");
        _;
    }

    // this function can recieve ether
    function deposit() public payable {}

    // this cant recieve any ether
    function nonPayable() public {}

    function withdraw() public CheckOwner {
        uint amount = address(this).balance; // 'this' keyword refer to smart contract itself
        (bool success, ) = owner.call{value: amount}(
            "amount withdrawn form contract"
        );

        require(success, "failed to receive ether");
    }

    function transfer(address payable _to, uint _amt) public {
        (bool success, ) = _to.call{value: _amt}("ether trasfferd");
        require(success, "failed to transfer to transfer to address");
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
