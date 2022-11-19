pragma solidity ^0.8.7;

contract LeftShift {
   uint []  arr = [45,6,1,2,3];

    function lsArray(uint256 index) public{
        require( index < arr.length, "index out of bound");
        for (uint i = index; i< arr.length-1; i++){
            arr[i] = arr[i+1];
        }
        arr.pop();

    }

    function getArr() public view returns(uint[] memory){
        return arr;
    }

}