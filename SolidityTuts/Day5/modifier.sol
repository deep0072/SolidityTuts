// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.6;

// modifier ==> these are used to do some valdiation like check owner. and can use in other function
// so that we really do not need to write redundant code .

// here we calling getNum function which can be called by only owner

// first we are settng the owner during deploymnet of contract via constructor
// then we call modifier checkOwner in getNum function
// if owner call the getNum will get output 36 other wise a prompt will be shown of "you are not the owner"
contract A {
    address public owner;

    constructor(address _owner) {
        owner = _owner;
    }

    modifier checkOwner(address _owner) {
        require(owner == _owner, " you are not the owner");
        _;
    }

    function getNum() public view checkOwner(msg.sender) returns (uint) {
        return 6 * 6;
    }
}
