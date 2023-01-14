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

describe("multisig", () => {
  let multiSigContract, deployedContract, ownerList;
  const numConfirmations = 2;
  before(async () => {
    multiSigContract = await ethers.getContractFactory("MultiSig");
    const [...addresses] = await ethers.getSigners();
    ownerList = [];
    j = 0;
    for (i of addresses) {
      if (j < 3) {
        ownerList.push(i.address);
        j += 1;
      }
    }

    deployedContract = await multiSigContract.deploy(
      [ownerList[0], ownerList[1], ownerList[2]],
      2
    );
    await deployedContract.deployed();

    multiSig = await ethers.getContractAt("MultiSig", ownerList[0]);
  });
  it("confirm owners of multisig", async () => {
    const contractOwner = await deployedContract.getOwner();

    assert.equal(ownerList.toString(), contractOwner.toString());
  });
  it("confirm number of confirmations", async () => {
    const contractConfirmations =
      await deployedContract.numsConfirmationsRequired();
    assert.equal(numConfirmations.toString(), contractConfirmations.toString());
  });

  it("submit transaction", async () => {
    const eth = ethers.utils.parseEther("2");
    const [...addresses] = await ethers.getSigners();
    const beforeTransction = await deployedContract.getTransactionCount();

    await deployedContract.submitTransaction(addresses[4].address, eth, "0xab");
    console.log(addresses[3].address, addresses[4].address);

    const afterTransactionCount = await deployedContract.getTransactionCount();

    assert.equal(beforeTransction, afterTransactionCount - 1);
  });
  it("submit transaction amit event", async () => {
    const eth = ethers.utils.parseEther("2");
    const [...addresses] = await ethers.getSigners();
    const beforeTransction = await deployedContract.getTransactionCount();

    await expect(
      await deployedContract.submitTransaction(
        addresses[4].address,
        eth,
        "0xab"
      )
    ).to.emit(deployedContract, "SubmitTransaction");

    const afterTransactionCount = await deployedContract.getTransactionCount();

    assert.equal(beforeTransction, afterTransactionCount - 1);
  });
});
