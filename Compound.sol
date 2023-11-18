//SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

interface cETH {
    
    // define functions of COMPOUND we'll be using
    
    function mint() external payable; // to deposit to compound
    function redeem(uint redeemTokens) external returns (uint); // to withdraw from compound
    
    //following 2 functions to determine how much you'll be able to withdraw
    function exchangeRateStored() external view returns (uint); 
    function balanceOf(address owner) external view returns (uint256 balance);
}

contract SmartBankAccount {
    //function of the total balance in contract

    uint public totalContractBalance = 0;

    function getContractBalance() public view returns (uint) {
        return totalContractBalance;
    }

    // add some balance to a user

    mapping(address => uint) balances;
    mapping(address => uint) depositTimestamps;

    function addBalance() public payable {
        balances[msg.sender] = msg.value;
        totalContractBalance = totalContractBalance + msg.value;
        depositTimestamps[msg.sender] = block.timestamp;
    }

    // function to calculates the user's balance with interest

    function getBalance(address userAddress) public view returns (uint) {
        uint principal = balances[userAddress];
        uint timeElapsed = block.timestamp - depositTimestamps[userAddress]; //seconds
        return
            principal +
            uint((principal * 7 * timeElapsed) / (100 * 365 * 24 * 60 * 60)) +
            1; //simple interest of 0.07%  per year
    }

    // function withdraw that allows users to withdraw funds.


    function withdraw() public payable {
        address payable withdrawTo = payable(msg.sender);
        uint amountToTransfer = getBalance(msg.sender);
        withdrawTo.transfer(amountToTransfer);
        totalContractBalance = totalContractBalance - amountToTransfer;
        balances[msg.sender] = 0;
    }
    
    function addMoneyToContract() public payable {
        totalContractBalance += msg.value;
    }
}
