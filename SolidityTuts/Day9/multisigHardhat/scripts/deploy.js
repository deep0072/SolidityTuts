// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const { ethers } = require("hardhat");
const hre = require("hardhat");

async function main() {
  let multiSigContract, deployedContract;
  multiSigContract = await ethers.getContractFactory("MultiSig");
  const [...addresses] = (await ethers.getSigners()).slice(0, 3);
  const ad = (deployedContract = await multiSigContract.deploy(
    [addresses[0], addresses[1], addresses[3]],
    2
  ));
  await deployedContract.deployed();
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
