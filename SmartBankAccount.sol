//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SmartBankAccount {
    uint public totalContractBalance = 0;

    function getContractBalance() public view returns (uint) {
        return totalContractBalance;
    }

    mapping(address => uint) balances;
    function addBalance(address userAddress, uint amount) public payable {
        balances[userAddress] = amount;
        totalContractBalance = totalContractBalance + amount;
    }
}
