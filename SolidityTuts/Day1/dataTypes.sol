pragma solidity ^0.8.7;

contract primitiveType {
    bool public bl = true;
    uint8 public u8 = 4;
    int8 public i8 = -4;
    uint16 public i16 = 200;
    uint256 public i256 = 1000000;

    int public minint = type(int).min; // it will shows minimum integer will be support by the int256
    int public maxint = type(int).max; // it will shows maximum integer will be support by the int256
    address public addr = 0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8; // 20 byte length or 160 bit

    
}


//----------------------------------------------------------
