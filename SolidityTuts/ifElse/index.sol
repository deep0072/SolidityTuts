pragma solidity ^0.8.17;

contract IFELSE {
    function foo(uint x) public pure returns (uint) {
        // ternary operator
        return x > 10 ? 1 : 0;
    }
}
