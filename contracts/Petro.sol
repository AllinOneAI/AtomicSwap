//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Petro {
	
	uint256 public ammount = 1 ether;
	uint256 public lockTime = 43200; //half day
	
    string public secret;
	bytes32 public hash;
	address public petroAddress;
	address public dmytroAddress;
	uint256 public timeTo;
	//bool public status;

	receive() external payable {
		timeTo = block.timestamp + lockTime;
		//status = true;
	}	

	constructor(address _dmytroAddress, bytes32 _hash) {
		petroAddress = msg.sender;
		dmytroAddress = _dmytroAddress;
		//status = false; 
	 	hash = _hash;	

	}


	modifier onlyOne() {
		require(msg.value == 1 ether, "nie prawidlowy");
		_;
	}
/*
	modifier onlyAfter() {
		require(status, "no-no");
		_;
	}
*/
	modifier onlyDmytro() {
		require(msg.sender == dmytroAddress, "you are not Dmytro");
		_;
	}

	modifier onlyPetro() {
		require(msg.sender == petroAddress, "you are not Petro");
		_;
	}


	function withdraw(string memory _secret) external onlyDmytro {
		require(block.timestamp < timeTo, "period expired");
		require(keccak256(abi.encodePacked(_secret)) == hash, "Invalid secret");
		payable(dmytroAddress).transfer(address(this).balance);
		secret = _secret;
        //status = true;
	}

	function refund() external onlyPetro {
		require(block.timestamp > timeTo, "it is not time yet");
		payable(petroAddress).transfer(address(this).balance);
		//status = true;
	}

}