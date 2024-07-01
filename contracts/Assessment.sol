// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

//import "hardhat/console.sol";

contract Assessment {
    address payable public owner;
    uint256 public balance;
    bool public paused; // State variable to track contract pause state

    event Deposit(uint256 amount);
    event Withdraw(uint256 amount);
    event Paused(address account);
    event Resumed(address account);

    constructor(uint initBalance) payable {
        owner = payable(msg.sender);
        balance = initBalance;
        paused = false; // Initialize contract as not paused
    }

    function getBalance() public view returns(uint256){
        return balance;
    }

    function deposit(uint256 _amount) public payable {
        uint _previousBalance = balance;

        // make sure this is the owner
        require(msg.sender == owner, "You are not the owner of this account");
        require(!paused, "Contract is paused");

        // perform transaction
        balance += _amount;

        // assert transaction completed successfully
        assert(balance == _previousBalance + _amount);

        // emit the event
        emit Deposit(_amount);
    }

    // custom error
    error InsufficientBalance(uint256 balance, uint256 withdrawAmount);

    function withdraw(uint256 _withdrawAmount) public {
        require(msg.sender == owner, "You are not the owner of this account");
        require(!paused, "Contract is paused");

        uint _previousBalance = balance;
        if (balance < _withdrawAmount) {
            revert InsufficientBalance({
                balance: balance,
                withdrawAmount: _withdrawAmount
            });
        }

        // withdraw the given amount
        balance -= _withdrawAmount;

        // assert the balance is correct
        assert(balance == (_previousBalance - _withdrawAmount));

        // emit the event
        emit Withdraw(_withdrawAmount);
    }

    function pauseContract() public {
        require(msg.sender == owner, "You are not the owner of this account");
        require(!paused, "Contract is already paused");

        paused = true;
        emit Paused(msg.sender);
    }

    function resumeContract() public {
        require(msg.sender == owner, "You are not the owner of this account");
        require(paused, "Contract is not paused");

        paused = false;
        emit Resumed(msg.sender);
    }
}
