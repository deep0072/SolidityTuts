pragma solidity ^0.8.7;

//Enums are the way of creating user-defined data types. every data store in enums will have their value wrt to index position
contract primitiveType {
    enum Juice {
        small, // default value is 0 as it is at first postion
        medium, // default value is 1
        large // default value is 2
    }

    Juice choice;

    function setLarge() public {
        choice = Juice.large;
    }

    function getChoice() public view returns (uint) {
        return uint(choice);
    }
}
