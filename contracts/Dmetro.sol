//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Dmetro {
	
	uint256 public ammount = 0.5 ether;
	uint256 public lockTime = 86400; //1 day
	
	string public secret;
	address public recipient;
	address public owner;
	uint256 public timeTo;

	receive() external payable {

	}	


	constructor() {
		owner = msg.sender;
		fund();
	}


	function fund() internal {
		timeTo = block.timestamp + lockTime;
		payable(address(this)).transfer(ammount);
	}


	function withdraw() {

	}

	function refund() {

	}


}