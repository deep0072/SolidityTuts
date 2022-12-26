//SPDX-License-Identifier : MIT
pragma solidity ^0.8.6;

contract MultiSig {

    event SubmitTransaction(address indexed sender ,address indexed _to,uint txIndex, uint _value, bytes _data);
    event ConfirmTransaction(address indexed owner, uint txIndex);
    event ExecuteTransaction(address indexed owner, uint txIndex);
    event Revoke(address indexed owner, uint txIndex);
    // first intialise the array of addresses
    address[] public owners;

    // now create mapping to tell address is owner or not 
    mapping(address=>bool) IsOwner;

    // create how many cofirmations are required to sign transactions

    uint256 public numsConfirmationsRequired;

    // this struct i used to get the transaction detail
    struct Transactions {
        address to;
        uint value;
        bytes data;
        bool executed;

        uint numsConfirmation;       

    }

    // this mapping i used to keep track of all confirmed transactions
    mapping(uint=>mapping(address=>bool)) isConfirmed;

    Transactions[] public transactions;


    // check caller of the function is owner
    modifier onlyOwner (){
        require(IsOwner[msg.sender], "not the owner");
        _;
    }

    modifier txExist(uint _txindex) {
        require(_txindex < transactions.length, "tx not exist");
        _;

    }

    modifier txNotExecuted(uint _txindex) {
        require(!transactions[_txindex].executed, "tx already executed");
        _;
    }

    modifier notTxConfirmed(uint _txindex){
        require(!isConfirmed[_txindex][msg.sender], "tx already confirmed");
        _;
    }

    constructor (address[] memory _owners, uint _numsConfirmationsRequired){
        require(_owners.length > 0, "atleast one owner is requried");
        require(_numsConfirmationsRequired > 0 && _numsConfirmationsRequired <= _owners.length, "invalid number of confirmationss");

        for (uint i = 0; i< _owners.length; i++){
            address owner = _owners[i];

            require(owner!=address(0), "invalid owner");
            require(!IsOwner[owner], "owner not unique");
            IsOwner[owner] = true;
            owners.push(owner);

        }

        numsConfirmationsRequired = _numsConfirmationsRequired;
    }

    // submit transaction 
    function submitTransaction(address _to, uint _value, bytes memory _data) public onlyOwner{

        uint txIndex = transactions.length;
        transactions.push(
            Transactions({
                to : _to,
                value: _value,
                data: _data,
                executed: false,
                numsConfirmation: 0,
            })
        );

        emit SubmitTransaction(msg.sender, _to, txIndex,_value, _data);
    }

    function confirmTransaction(uint _txIndex) public onlyOwner txExist(_txIndex) txNotExecuted(_txIndex) notTxConfirmed(_txIndex){
        Transactions storage transaction = transactions[_txIndex];

        transaction.numsConfirmation +=1;
        isConfirmed[_txIndex][msg.sender] = true;
        emit ConfirmTransaction(msg.sender, _txIndex);


    }


    function executeTransaction(uint _txIndex) public onlyOwner txExist(_txIndex) txNotExecuted(_txIndex) notTxConfirmed(_txIndex) {
        Transactions storage transaction = transactions[_txIndex];
        require(transaction.numsConfirmation >= numsConfirmationsRequired, "cant execute");
        transaction.executed = true;
        (bool success,) = transaction.to.call{value:transaction.value}(transaction.data); // transaction.to is address that is fetching amount

        require(success, "tx failed");
        emit ExecuteTransaction(msg.sender, _txIndex);

    }

    function revokeConfirmation(uint _txIndex) public onlyOwner txExist(_txIndex) txNotExecuted(_txIndex) notTxConfirmed(_txIndex) {
        Transactions storage transaction = transactions[_txIndex];
        require(isConfirmed[_txIndex][msg.sender], "not confirmed");

        transaction.numsConfirmation -=1;
        isConfirmed[_txIndex][msg.sender] = false;
        emit Revoke(msg.sender, _txIndex);


    }


    function getOwner() public view returns(address[] memory){
        return owners;
    }

    function getTransactionCount() public view returns(uint){
        return transactions.length;
    } 

    function getTransaction(uint _txIndex) public view returns( address to, uint value, bytes[] data, uint numocnfirmations){
        Transactions memory transaction = transactions[_txIndex];

        return (
            transaction.to,
            transaction.value,
            transaction.data,            
            transaction.numsConfirmation


        );

       

       
    }
}