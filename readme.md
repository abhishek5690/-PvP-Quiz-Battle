# PvP Quiz Battle

## Project Description
PvP Quiz Battle is a decentralized application (DApp) that allows two players to compete in a quiz-based battle. Players pay an entry fee to participate, and the winner is rewarded with the combined prize pool. The game is managed via a smart contract deployed on the Ethereum blockchain.

## Contract Address
0xFD35F4Fba689FcB0F9846d00492d8C4afeDd975F
![image](https://github.com/user-attachments/assets/a7ef83c3-d76d-44d3-a772-e12cb97794ba)


## Project Vision
The goal of PvP Quiz Battle is to bring competitive quiz gaming to the blockchain, ensuring transparency, fairness, and decentralized management. By leveraging smart contracts, players can trust that the game’s outcomes are immutable and verifiable.

## Key Features
- **Decentralized Gameplay:** The entire game logic is managed via a secure and transparent smart contract.
- **Entry Fee Management:** Players pay a fixed entry fee to join a game, ensuring equal stakes for both participants.
- **Score Management:** Player scores are updated by the contract owner during the game.
- **Automatic Winner Declaration:** The smart contract declares the winner based on scores and distributes the prize pool accordingly.
- **Secure Winnings Withdrawal:** Players can securely withdraw their winnings from the contract.
- **Game Reset:** Automatic game reset after the winner is declared, allowing new players to join.

---

## Usage

### Deployment
The smart contract is written in Solidity and is compatible with Ethereum Virtual Machine (EVM)-based blockchains. Use a development environment like [Remix](https://remix.ethereum.org/) or [Hardhat](https://hardhat.org/) to deploy the contract.

### Functions
1. `joinGame`: Players can call this function to join an ongoing game by paying the entry fee.
2. `updateScore`: Only the owner can call this function to update the score of a player.
3. `declareWinner`: The owner declares the winner and distributes the prize pool.
4. `withdrawWinnings`: Players can call this function to withdraw their earnings.

---

