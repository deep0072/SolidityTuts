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

contract A {
    function foo() public pure returns (string memory) {
        return "hi from A to B contract";
    }
}

contract B is A {
    function getFoo() public pure returns (string memory) {
        return A.foo(); // here we calling parent A contract function
    }
}
