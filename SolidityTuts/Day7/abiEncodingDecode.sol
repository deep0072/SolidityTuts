pragma solidity ^0.8.6;

// abi is application binanry interface. whenver frontend deal with blokchain itself.

// when user  put the data to blockchain then it will interact with abi and inputed data will get convert to bytes
// whenver user read data from blockchain then it will convert from bytes to human readable format this is decoding via abi

// abi not changes during decoding and encoding process

contract EncodeDecode {
    function encode(
        string memory _str1,
        uint _int,
        string memory _str2
    ) public pure returns (bytes memory) {
        return abi.encode(_str1, _int, _str2);
    }

    function abiDecoding(bytes memory data)
        public
        pure
        returns (
            string memory _str1,
            uint _int,
            string memory _str2
        )
    {
        (_str1, _int, _str2) = abi.decode(data, (string, uint, string));
    }
}
