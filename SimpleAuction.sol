// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleAuction {
    address public owner;
    address public highestBidder;
    uint public highestBid;
    bool public auctionEnded;

    constructor() {
        owner = msg.sender;
    }

    // Place a bid
    function bid() public payable {
        require(!auctionEnded, "Auction already ended");
        require(msg.value > highestBid, "There already is a higher bid");

        // Refund previous highest bidder
        if (highestBid != 0) {
            payable(highestBidder).transfer(highestBid);
        }

        highestBidder = msg.sender;
        highestBid = msg.value;
    }

    // End the auction (only owner can do this)
    function endAuction() public {
        require(msg.sender == owner, "Only owner can end the auction");
        require(!auctionEnded, "Auction already ended");

        auctionEnded = true;

        // Send highest bid to the owner
        payable(owner).transfer(highestBid);
    }

    // View current highest bidder and bid
    function getHighestBid() public view returns (address, uint) {
        return (highestBidder, highestBid);
    }
}