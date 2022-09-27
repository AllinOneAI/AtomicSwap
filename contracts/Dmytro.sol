//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
//secret: aurora
contract Dmytro {
	
	uint256 public ammount = 0.5 ether;
	uint256 public lockTime = 86400; //1 day
	
	bytes32 public hash;
	address public petroAddress;
	address public dmytroAddress;
	uint256 public timeTo;
	//bool public status; 

	receive() external payable onlyHalf {
		timeTo = block.timestamp + lockTime;
		//status = true;
	}	

	constructor(address _petroAddress, bytes32 _hash) {
		dmytroAddress = msg.sender;
		petroAddress = _petroAddress;
		//status = false; 
	 	hash = _hash;	

	}


	modifier onlyHalf() {
		require(msg.value == 0.5 ether, "nie prawidlowy");
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


	function withdraw(string memory _secret) external onlyPetro {
		require(block.timestamp < timeTo, "period expired");
		require(keccak256(abi.encodePacked(_secret)) == hash, "Invalid secret");
		payable(petroAddress).transfer(address(this).balance);
		//status = true;
	}

	function refund() external onlyDmytro {
		require(block.timestamp > timeTo, "it is not time yet");
		payable(dmytroAddress).transfer(address(this).balance);
		//status = true;
	}

}