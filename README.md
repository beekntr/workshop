pragma solidity ^0.8.0;

/**
 * @title Community Tipping System
 * @dev A simple tipping contract for peer rewards
 */
contract CommunityTipping {
    address payable public recipient = payable(0xDc6F9cF89Ac48AD3c3c4BA75Cf38dE8ccB68A2ea);

    /**
     * @dev Emitted when a tip is sent
     * @param sender The address of the tipper
     * @param amount The amount of tip sent
     */
    event Tipped(address indexed sender, uint256 amount);

    /**
     * @dev Emitted when funds are withdrawn
     * @param amount The total amount withdrawn
     */
    event Withdrawn(uint256 amount);

    /**
     * @notice Allows users to send tips to the contract
     */
    function tip() external payable {
        require(msg.value > 0, "Tip amount must be greater than zero");
        emit Tipped(msg.sender, msg.value);
    }

    /**
     * @notice Withdraws all funds to the recipient
     */
    function withdraw() external {
        uint256 balance = address(this).balance;
        require(balance > 0, "No funds to withdraw");
        recipient.transfer(balance);
        emit Withdrawn(balance);
    }
}
