Sentiment-Based Voting Smart Contract

Project Description

The Sentiment-Based Voting Smart Contract is an Ethereum-based voting system that leverages sentiment analysis to determine the weight of votes. Instead of traditional voting where each vote has equal weight, this contract assigns voting power based on sentiment scores (ranging from 1 to 100). Users can cast their votes for predefined candidates, with their sentiment score determining the impact of their vote.
Smart Contract Address 0xe5E1798c0c74bd7E35BDe0104E371dbdB3Ef4193
Features

Sentiment-driven weighted voting

Prevents double voting

Transparent vote tracking

How It Works

A user submits a vote along with a sentiment score (externally determined).

The contract records the vote, weighting it based on the sentiment score.

Users can query the vote count for a candidate.

Usage

To interact with the smart contract, use a Web3 interface or directly call the functions:
License

This project is licensed under the MIT License.

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

