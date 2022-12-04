// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.6;

// to recieve ether in contract we need to use recieve and fallback inbuilt function

contract FallbackandRecieve {
    /**
     *
     *  To receive Ether and add it to the total balance of the contract,
     *  the fallback function must be marked payable
     * If no such function exists, the contract cannot
     * receive Ether through regular transactions and will throw an exception
     *
     *
     */
    fallback() external payable {} // it used when msg.data is not empty

    receive() external payable {} // it can be called without using msg.data

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
