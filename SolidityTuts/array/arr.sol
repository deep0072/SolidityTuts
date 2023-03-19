pragma solidity ^0.8.17;

contract Array {
    // Several ways to initialize an array
    uint[] public arr1;
    uint[3] public arr2;
    uint[] public arr = [7, 8, 9, 4];

    function getItem(uint _index) public view returns (uint) {
        return arr[_index];
    }

    // return entire array
    // but this should avoided array can grow at any length

    function getArray() public view returns (uint[] memory) {
        return arr1;
    }

    //add item in arr

    function push(uint item) public {
        arr1.push(item);
    }

    // remove item from an array using pop
    // this will decrease the length
    function pop() public {
        arr.pop();
    }

    function getLength() public view returns (uint) {
        return arr1.length;
    }

    // remove item from an array at given index
    // removal does not changes the lenght of an array
    // removed value reset to its default value at the index
    function remove(uint _index) public {
        require(_index < arr.length, "out of the bound");
        return delete arr[_index];
    }

    //create an array in memory, only fixed size can be created

    function examples() external pure {
        // here we are create empty array with length of 5
        uint[] memory a = new uint[](5);
    }
}
