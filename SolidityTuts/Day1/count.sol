pragma solidity ^0.8.6;

contract Counter {
    uint count;

    // changin  the greet
    function inc() public {
        count++;
    }

    function dec() public {
        count--;
    }

    function getCount() public view returns (uint) {
        // read data using 'view' keyword that wont cause any gas fee
        return count;
    }
}
