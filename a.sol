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
