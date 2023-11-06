require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */

const privatekey = "fe18b0c7d7fa87a0ba135a8163571bc87dd24c2e49a8b609bd87cdff975c37e2";

module.exports = {
        defaultNetwork: "localhost",
        networks: {
                  hardhat: {
                            },
                  devnet: {
                          url: "http://localhost:9999",
                              accounts: [privatekey]
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
        timeout: 40000,
        from: "0x7B8dDEfAE4BC81820Ac38DECa9Bd0D09597b83b9"
};
