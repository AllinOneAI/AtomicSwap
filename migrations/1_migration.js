const Dmytro = artifacts.require("Dmytro");
const Petro = artifacts.require("Petro");


module.exports = function(deployer, network){
    
    if (network == "goerli") {
        deployer.deploy(Dmytro, "0x6D6b1b7A2597252AaDB7987375721fDB09b34e91", "0x2b0bf3b8ffaa4f3d1f97760d4444588443c3a91288c5002483449aba1054192b")
    }

    if (network == "ropsten") {
        deployer.deploy(Petro, "0xA308d1d27e687ac3a2801f44bB061d4dE420D65F", "0x2b0bf3b8ffaa4f3d1f97760d4444588443c3a91288c5002483449aba1054192b")
    }
}
