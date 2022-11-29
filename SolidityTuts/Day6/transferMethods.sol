pragma solidity ^0.8.6;

contract TypesOfTransfer {
    function transferEth(address payable _to) public payable {
        // not recomended way
        _to.transfer(msg.value); // gas limit 2300
    }

    function sendEth(address payable _to) public payable {
        // not recomended way
        bool sent = _to.send(msg.value); // gas limit 2300
        require(sent, "not sent");
    }

    function callSendEth(address payable _to) public payable {
        (bool success, ) = _to.call{gas: 10000, value: msg.value}("");
        require(success, "success");
    }
}
