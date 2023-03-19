pragma solidity ^0.8.17;

// Solidity supports enumerables and they are useful to model choice and keep track of state.
// Enums can be declared outside of a contract.
contract Enums {
    enum Status {
        Pending,
        Shipping,
        Accepted,
        Rejected,
        Caceled
    }

    Status public status;

    // / Default value is the first element listed in
    // Pending  - 0
    // Shipped  - 1
    // Accepted - 2
    // Rejected - 3
    // Canceled - 4

    function get() public view returns (Status) {
        return status; // it will return the by default value first item in Status enum
    }

    // Update status by passing uint into input
    function set(Status _status) public {
        status = _status; // when we set the value then get function will return the output on the basis of this function
    }

    // update specific enum
    function cancel() public {
        status = Status.Caceled;
    }

    // reset the status to its first enum
    function reset() public {
        delete status;
    }
}
