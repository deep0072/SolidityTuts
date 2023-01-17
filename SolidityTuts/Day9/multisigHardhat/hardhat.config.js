require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.17",
  gasReporter: {
    enabled: true,
    currency: "INR",
    noColors: true,
    outputFile: "gasReports.txt",
    coinmarketcap: "4e1796d9-7d73-41cb-871c-42189bfed03c",
    token: "metic",
  },
};
