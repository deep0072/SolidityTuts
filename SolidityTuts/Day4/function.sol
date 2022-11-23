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
        return (45, false, 56); // output {"0":"45","1":false,"2":"56"}
    }

    function returnNamed()
        public
        pure
        returns (
            uint x,
            bool y,
            uint z
        )
    {
        return (x, y, z); // output {"0":"0","1":false,"2":"0","x":"0","y":false,"z":"0"}
    }

    function assignedValues()
        public
        pure
        returns (
            uint x,
            bool y,
            uint z
        )
    {
        x = 45;
        y = true;
        z = 6;
        return (x, y, z);
    }

    function destructuring()
        public
        pure
        returns (
            uint x,
            bool y,
            uint z,
            uint,
            uint
        )
    {
        (x, y, z) = returnMultiple();
        (uint a, , uint b) = (10, 20, 50);
        return (x, y, z, a, b);
    }
}

contract SecondFunctionContract {
    function secondFunction(
        uint a,
        uint b,
        address c
    )
        public
        pure
        returns (
            uint,
            uint,
            address
        )
    {}

    function callFunction()
        external
        view
        returns (
            uint,
            uint,
            address
        )
    {
        return secondFunction(4, 5, msg.sender);
    }
}
