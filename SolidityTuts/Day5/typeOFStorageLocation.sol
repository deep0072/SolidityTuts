/* storage ==> Storage is the easiest to grasp — it is where all state variables are stored
.constant state variables are not saved into a storage slot*/

/*
memory  ==> is reserved for variables that are defined within the scope of a function
They only persist while a function is called, 

these are temporary and modifiable variables

 */

/*
Calldata ==> is an immutable, temporary location where function arguments are stored, and behaves mostly like memory

Arrays and structs with calldata data location can also be returned from functions
these are temporary and but not modifiable variables. these are also function scoped

*/

// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.6;

contract DataLocations {
    string public AccountName = "Deepak";

    function displayAccName() public returns (string memory) {
        return AccountName;
        // gas used 31812
    }

    function displayMemoryData(string memory _name)
        public
        pure
        returns (string memory)
    {
        // we can modify the _name variable here
        _name = "deepak";
        return _name;
    }

    function displayCallData(string calldata _name)
        public
        pure
        returns (string calldata)
    {
        return _name;
        // here we cant modify the _name variable
    }
}
