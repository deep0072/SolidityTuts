pragma solidity ^0.8.6;

contract Computer {
    function Show() public pure virtual returns (string memory) {
        // as it is being overriden in laptop conract so it will have virual keyword
        return "it is concept";
    }
}

// is keyword inherit the all function define in Computer
contract Laptop is Computer {
    function Show() public pure override returns (string memory) {
        // here i wll use override because it is already define in Computer contract.
        return "i7 gen 16 gb ram 512 ssd";
    }
}
