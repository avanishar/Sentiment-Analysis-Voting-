# Sentiment Analysis Voting Smart Contract

## Project Description
The **Sentiment Analysis Voting Smart Contract** is an Ethereum-based system that enables voting based on sentiment analysis. The contract assumes that sentiment scores are externally computed and assigned to predefined candidates. Voting power is determined by sentiment values, meaning a more positive sentiment gives more voting weight.

## Smart Contract Address
```
0xe5E1798c0c74bd7E35BDe0104E371dbdB3Ef4193
```

## Features
- Sentiment-based weighted voting
- Prevents double voting
- Transparent vote tracking

## How It Works
1. Sentiment scores are externally computed for candidates.
2. Users vote for predefined candidates, with sentiment scores determining vote weight.
3. The contract records votes and allows querying of candidate vote counts.

## Smart Contract
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SentimentVoting {
    mapping(string => uint256) public votes;  // Stores votes per candidate
    mapping(address => bool) public hasVoted; // Tracks if an address has voted

    function vote(string memory candidate, uint256 sentimentScore) public {
        require(!hasVoted[msg.sender], "Already voted");
        require(sentimentScore > 0 && sentimentScore <= 100, "Invalid sentiment score");

        votes[candidate] += sentimentScore; 
        hasVoted[msg.sender] = true;
    }

    function getVotes(string memory candidate) public view returns (uint256) {
        return votes[candidate];
    }
}
```

## License
This project is licensed under the MIT License.

