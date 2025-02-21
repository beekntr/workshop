// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PeerTipping {
    mapping(address => uint256) public balances;

    event Tipped(address indexed sender, address indexed recipient, uint256 amount);

    function tip(address recipient) public payable {
        require(msg.value > 0, "Tip amount must be greater than zero");
        balances[recipient] += msg.value;
        emit Tipped(msg.sender, recipient, msg.value);
    }

    function withdraw() public {
        uint256 amount = balances[msg.sender];
        require(amount > 0, "No funds to withdraw");

        balances[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }
}
