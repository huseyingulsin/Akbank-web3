// SPDX-License-Identifier: MIT


pragma solidity ^0.8.7;



contract FeeCollector {
    // we need to define the variables
    address public owner;
    uint256 public balance;
    // constructor works firstly in a program. So we can define the owner in constructor.
    constructor() {
        owner = msg.sender;

    }
    // if you want to create payable function you can youse receive with payable keyword.
    receive() payable  external {
        balance += msg.value;

    }

    // the main function is here. I created a function for withdrawal. There are some requirements firstly.
    // After the requirements, it transfers the amount to the address. Then you should decrease the amount.
    function withdraw (uint amount, address payable destAddr) public {
        require(msg.sender == owner, "Only the owner can withdraw");
        require(amount <= balance, "Insufficient funds");

        destAddr.transfer(amount);
        balance -= amount;

    }
}
