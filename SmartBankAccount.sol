//SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract SmartBankAccount {

    uint public totalContractBalance = 0;

    function getAccountBalance() public view returns(uint){
        return totalContractBalance;
    }
    
    mapping(address => uint) balances;
    
    function addBalance() public payable {
        balances[msg.sender] = msg.value;
        totalContractBalance = totalContractBalance + msg.value;
    }
}
