//require("@nomicfoundation/hardhat-toolbox");
require("@nomicfoundation/hardhat-ethers");

/** @type import('hardhat/config').HardhatUserConfig */

module.exports = {
        //defaultNetwork: "localhost",
        networks: {
                  devnet2: {
                          url: "http://127.0.0.1:8545",
			      //accounts: [privatekey2],
                              chainId: 9999
                            }
        },
        solidity: {
                  version: "0.8.19",
                  settings: {
                              optimizer: {
                                            enabled: true,
                                            runs: 200
                                          }
                            }
        },
        timeout: 40000
};
