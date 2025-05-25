---

## SimpleAuction

A smart contract that allows users to place bids in an auction. The highest bidder wins.

### Features:
- Anyone can place a bid (must be higher than the current highest bid)
- Previous highest bidder gets refunded
- Only the contract owner can end the auction
- Highest bid is transferred to the owner after auction ends

### How It Works:
1. Call `bid()` with Ether to place a bid
2. View current winner using `getHighestBid()`
3. Owner calls `endAuction()` to end the auction and collect funds
