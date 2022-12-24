const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Erc20  testing", function () {
  let token;
  let accounts;
  const amount = ethers.utils.parseEther("1");

  // before i used to do those task that we need to do something before actual task
  before(async () => {
    const contract = await ethers.getContractFactory("ICO");
    token = await contract.deploy();
    accounts = await ethers.getSigners(); // give the accounts that ethers.js contain

    await token.deployed();
  });

  it("assign intial balance", async function () {
    const totalSupply = await token.totalSupply();
    expect(await token.balanceOf(accounts[0].address)).to.equal(totalSupply);
  });

  it("other address do not have access to mint tokens", async function () {
    const wallet = await token.connect(accounts[1]);
    await expect(wallet.mint(accounts[1].address, amount)).to.be.reverted; // if mint not worked then it will be reverted
  });

  it("other address do not have access to burn tokens", async function () {
    const wallet = await token.connect(accounts[1]);
    await expect(wallet.Burn(accounts[1].address, amount)).to.be.reverted; // if mint not worked then it will be reverted
  });

  it("buying token with ether", async function () {
    const wallet = token.connect(accounts[1]);
    const option = { value: amount };
    const calculated_value = option.value.mul(1000); // these are the token will be transffered to
    await wallet.Buy(option);
    expect(await wallet.balanceOf(accounts[1].address)).to.equal(
      calculated_value
    );
  });
});
