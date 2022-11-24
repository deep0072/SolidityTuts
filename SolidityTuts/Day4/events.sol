pragma solidity ^0.8.6;


//events are stored in LOGS ds. 
contract EventLog {
    event getResponse(address indexed sender, string message);

    function getEvent() public {
        emit getResponse(msg.sender, "hello there");
    }
}

/*

output of events = => {
		"from": "0xd9145CCE52D386f254917e481eB44e9943F39138",
		"topic": "0x8ed4d540d1df9928f85b8e038022738fb6448e15aa1c4d68851903a592465eb7", // this will be the unique hash wrt to event
		"event": "getResponse",
		"args": {
			"0": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
			"1": "hello there",
			"sender": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
			"message": "hello there"
		}
	}
*/
