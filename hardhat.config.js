// npx hardhat run scripts/deployAll.js --network ftm

require("@nomiclabs/hardhat-waffle");
module.exports = {
  networks: {
    rinkeby: {
      url: 'https://rinkeby.infura.io/v3/7102938a14af4e9f86d56e307ae79067',
      accounts: [`252ee49d1523b7bb89be48db760d5b474c3305f39dcb568d040ffb5b7147944f`],
      gasLimit: 29999972000000000
    }
  },
  solidity: {
    compilers: [
      {
        version: "0.6.6",
        settings: {
          optimizer: {
            enabled: true,
            runs: 200
          }
        }
      },
      {
        version: "0.5.16",
        settings: {
          optimizer: {
            enabled: true,
            runs: 200
          }
        }
      },
      {
        version: "0.4.26",
        settings: {
          optimizer: {
            enabled: true,
            runs: 200
          }
        }
      },
      {
        version: "0.7.5",
        settings: {
          optimizer: {
            enabled: true,
            runs: 200
          }
        }
      },
      {
        version: "0.8.2",
        settings: {
          optimizer: {
            enabled: true,
            runs: 200
          }
        }
      },
    ],
  },
  mocha: {
    timeout: 200000000
  }
};
