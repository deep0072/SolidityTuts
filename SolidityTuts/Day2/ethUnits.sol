pragma solidity ^0.8.6;

contract Structure {
    // ether keyword ==> 10 followed by 18 zeros
    // wei keyword => always will be 1 wei is 1
    uint public OneWei = 2 wei;

    bool public isOneWei = 1 wei == 1;

    uint public oneEther = 1 ether;

    bool public isOnether = 1 ether == 1;
}
