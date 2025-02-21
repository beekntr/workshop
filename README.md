# 💰 Community Tipping System  

A **simple and transparent tipping smart contract** that allows users to send peer rewards and withdraw funds easily.  

## 🔥 Features  
✅ **Send Tips** - Users can send ETH tips effortlessly.  
✅ **Secure & Transparent** - Events are emitted for every transaction.  
✅ **Easy Withdrawal** - The recipient can withdraw all accumulated tips.  

## 🛠️ How It Works  
1️⃣ **Send a Tip**: Call the `tip()` function and send ETH.  
2️⃣ **Withdraw Funds**: The recipient calls `withdraw()` to receive all tips.  

## ⚡ Smart Contract  
```solidity
pragma solidity ^0.8.0;

/**
 * @title Community Tipping System
 * @dev A simple tipping contract for peer rewards
 */
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
```

## 📌 Deployment & Usage  
1️⃣ Deploy the contract on **Ethereum** or any compatible blockchain.  
2️⃣ Interact with the contract via **Etherscan, Remix, or Web3.js**.  

## 🚀 Future Enhancements  
🔹 Multi-recipient tipping  
🔹 Time-based withdrawals  
🔹 Advanced tipping analytics  

---  

🔥 **Built with Solidity | No External Dependencies** 🔥  
