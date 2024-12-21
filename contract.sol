// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PvPQuizBattle {
    struct Player {
        address playerAddress;
        uint256 score;
    }

    address public owner;
    uint256 public entryFee;
    mapping(address => uint256) public playerBalances;

    Player public player1;
    Player public player2;
    bool public gameActive;

    event GameStarted(address indexed player1, address indexed player2);
    event ScoreUpdated(address indexed player, uint256 newScore);
    event WinnerDeclared(address indexed winner, uint256 prizeAmount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }

    modifier onlyGameActive() {
        require(gameActive, "No active game is running.");
        _;
    }

    constructor(uint256 _entryFee) {
        owner = msg.sender;
        entryFee = _entryFee;
    }

    function joinGame() external payable {
        require(msg.value == entryFee, "Incorrect entry fee.");
        require(!gameActive, "A game is already in progress.");

        if (player1.playerAddress == address(0)) {
            player1 = Player(msg.sender, 0);
        } else if (player2.playerAddress == address(0)) {
            player2 = Player(msg.sender, 0);
            gameActive = true;
            emit GameStarted(player1.playerAddress, player2.playerAddress);
        } else {
            revert("Game is full.");
        }
    }

    function updateScore(address player, uint256 score) external onlyOwner onlyGameActive {
        if (player == player1.playerAddress) {
            player1.score = score;
        } else if (player == player2.playerAddress) {
            player2.score = score;
        } else {
            revert("Player not found in the current game.");
        }

        emit ScoreUpdated(player, score);
    }

    function declareWinner() external onlyOwner onlyGameActive {
        require(player1.score != player2.score, "The game is tied. Resolve the tie first.");

        address winner;
        uint256 prizeAmount = address(this).balance;

        if (player1.score > player2.score) {
            winner = player1.playerAddress;
        } else {
            winner = player2.playerAddress;
        }

        playerBalances[winner] += prizeAmount;
        emit WinnerDeclared(winner, prizeAmount);

        resetGame();
    }

    function withdrawWinnings() external {
        uint256 balance = playerBalances[msg.sender];
        require(balance > 0, "No winnings to withdraw.");

        playerBalances[msg.sender] = 0;
        payable(msg.sender).transfer(balance);
    }

    function resetGame() internal {
        delete player1;
        delete player2;
        gameActive = false;
    }
}

