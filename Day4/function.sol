pragma solidity ^0.8.6;

contract Function {
    function returnMultiple()
        public
        pure
        returns (
            uint,
            bool,
            uint
        )
    {
        return (45, false, 56); // 
    }
}
