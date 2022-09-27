
const HDWalletProvider = require('@truffle/hdwallet-provider');    
const Mnemonic = process.env.WALLET_MNEMONIC;
module.exports = {

  networks: {
     development: {
      host: "127.0.0.1",     // Localhost (default: none)
      port: 7545,            // Standard Ethereum port (default: none)
      network_id: "*",       // Any network (default: none)
     },

   goerli: {
     network_id: "5",
      //gasPrice: 10,
      provider: new HDWalletProvider({
        mnemonic: Mnemonic,
        providerOrUrl: "https://goerli.infura.io/v3/67d27f10fa6d4dcdb7575f9ee8df4f5c",
        from: "0xA308d1d27e687ac3a2801f44bB061d4dE420D65F",
      })
    }, 
     
   ropsten: {
     network_id: "3",
      //gasPrice: 10,
      provider: new HDWalletProvider({
        mnemonic: Mnemonic,
       providerOrUrl: "https://ropsten.infura.io/v3/67d27f10fa6d4dcdb7575f9ee8df4f5c",
       from: "0x6D6b1b7A2597252AaDB7987375721fDB09b34e91",
      })
    }  
  },

  mocha: {
  },

  compilers: {
    solc: {
      version: "0.8.17",      // Fetch exact version from solc-bin (default: truffle's version)
    }
  },

};
