/*
1. Check the wallet for the correct number of private keys.
2. Verify that the wallet is configured to require two or more keys to sign and send a transaction. 
3. Test the wallet's ability to securely store passwords. 
4. Test the multisig wallet's ability to process transactions with multiple parties. 
5. Test the wallet's ability to send funds to other wallets. 
6. Test the wallet's ability to track and monitor activity. 
7. Test the wallet's ability to identify and prevent unauthorized access. 
8. Verify that the wallet is secure against cyber attacks. 
9. Test the wallet's compatibility with other blockchain systems. 
10. Test the wallet's ability to handle multiple digital assets.
*/

const { ethers } = require("hardhat");

const { assert, expect } = require("chai");

describe("multisig testing", () => {
  let multiSigContract, deployedContract, ownerList, multiSigAddress, addresses;

  const numOfConfirmations = 2;
  before(async () => {
    multiSigContract = await ethers.getContractFactory("MultiSig");
    [...addresses] = await ethers.getSigners();

    ownerList = [];
    ownerList.push(
      addresses[0].address,
      addresses[1].address,
      addresses[3].address
    );

    deployedContract = await multiSigContract.deploy(
      [addresses[0].address, addresses[1].address, addresses[2].address],
      numOfConfirmations
    );
    await deployedContract.deployed();
    multiSigAddress = deployedContract.address;
    const contractBalance = await ethers.provider.getBalance(multiSigAddress);
    // Get the balance of the contract in ether
    // Get the balance of the contract in wei
  });
  it("confirm owners of multisig", async () => {
    const contractOwner = await deployedContract.getOwner();

    assert.equal(ownerList.length, contractOwner.length);
  });

  // submit transaction
  it("submit transaction", async () => {
    const eth = ethers.utils.parseEther("2");

    const beforeTransction = await deployedContract.getTransactionCount();

    await deployedContract.submitTransaction(addresses[4].address, eth, "0xab");

    const address4 = await ethers.provider.getBalance(addresses[4].address);

    const afterTransactionCount = await deployedContract.getTransactionCount();

    assert.equal(beforeTransction, afterTransactionCount - 1);
  });

  // getting an event after submittion of tx
  it("submit transaction emit event", async () => {
    const eth = ethers.utils.parseEther("2");

    await expect(
      await deployedContract.submitTransaction(
        addresses[4].address,
        eth,
        "0xab"
      )
    ).to.emit(deployedContract, "SubmitTransaction");
  });

  // confirm transaction
  it("Transaction is confirmed", async () => {
    const indexOfTransactionToBeConfirmed = 0;
    const accounts = await ethers.getSigners();
    const firstOwner = accounts[0];

    const secondOwner = accounts[1];

    const firstWallet = await deployedContract.connect(firstOwner);
    await firstWallet.confirmTransaction("0");

    // Second Confirmation
    const secondWallet = await deployedContract.connect(secondOwner);
    await secondWallet.confirmTransaction("0");

    const myTransaction = await secondWallet.getTransaction("0");
    console.log(myTransaction.numConfirmations, numOfConfirmations);
    assert.equal(myTransaction.numConfirmations, numOfConfirmations.toString());
  });

  it("revoke transaction", async () => {
    try {
      await deployedContract.revokeConfirmation(0);
    } catch (err) {
      console.log("tranasaction dont need to be revoked");
    }
  });

  //execute transactions
  it("executeTransaction", async () => {
    const beforeExecution = await deployedContract.transactions(0);
    console.log(beforeExecution["executed"]);

    // send some eth before exexution

    const ethValue = ethers.utils.parseEther("3");

    await addresses[0].sendTransaction({
      to: multiSigAddress,
      value: ethValue,
    });

    const oldcontractBalance = await ethers.provider.getBalance(
      multiSigAddress
    );
    const oldBalanceOfRecpeient = await ethers.provider.getBalance(
      addresses[4].address
    );
    await deployedContract.executeTransaction(0);
    const afterExecution = await deployedContract.transactions(0);

    const newcontractBalance = await ethers.provider.getBalance(
      multiSigAddress
    );
    expect(newcontractBalance).to.be.lt(oldcontractBalance);
    const newBalanceOfRecpeient = await ethers.provider.getBalance(
      addresses[4].address
    );

    expect(newBalanceOfRecpeient).to.be.gt(oldBalanceOfRecpeient);
    assert.equal(true, afterExecution["executed"]);
  });
});
