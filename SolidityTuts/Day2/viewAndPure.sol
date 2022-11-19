contract Structure {
    uint public x = 45;

    /* view function do not change the state varibale value . it can read already decalred variable in smartcontract
     we can add modify but can't read change state variable value*/
    function setX(uint x_) public view returns (uint) {
        // we are not setting this value in state variable it is storing in other variable
        x + x_;
        return x; // output still 45 not 49
    }

    // pure function ==> do not use already declared variable in smart contract. means can not read the already declare variable or global variable
    function getX(uint y) public pure returns (uint) {
        return 2 * y; //
    }
}
