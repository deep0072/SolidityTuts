pragma solidity ^0.8.6;

library RemoveArray {
    // these dont use state variable

    function remove(uint[] storage arr, uint index) public {
        require(arr.length > 0, "cant remove from array");
        arr[index] = arr[arr.length - 1];
        arr.pop();
    }
}

contract TestArray {
    // calling library here
    using RemoveArray for uint[]; // for this data type array attach all function mentioned in RemoveArray library
    uint[] public arr;

    function getArray() public returns (uint[] memory) {
        for (uint i = 0; i < 5; i++) {
            arr.push(i);
        }
        arr.remove(1); // .remove function defined in library is called

        return arr;
    }
}
