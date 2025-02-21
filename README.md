pragma solidity ^0.8.0;

contract CommunityTipping {
    address payable public recipient = payable(0xDc6F9cF89Ac48AD3c3c4BA75Cf38dE8ccB68A2ea);

    event Tipped(address indexed sender, uint256 amount);
    event Withdrawn(uint256 amount);

    function tip() external payable {
        require(msg.value > 0, "Tip amount must be greater than zero");
        emit Tipped(msg.sender, msg.value);
    }

    function withdraw() external {
        uint256 balance = address(this).balance;
        require(balance > 0, "No funds to withdraw");
        recipient.transfer(balance);
        emit Withdrawn(balance);
    }
}
