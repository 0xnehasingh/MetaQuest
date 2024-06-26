// SPDX-License-Identifier: MIT
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
    uint totalContractBalance = 0;

    address COMPOUND_CETH_ADDRESS = 0x859e9d8a4edadfEDb5A2fF311243af80F85A91b8;
    cETH ceth = cETH(COMPOUND_CETH_ADDRESS);

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

        // send ethers to mint()
        ceth.mint{value: msg.value}();
    }

    // function to calculates the user's balance with interest
    function getBalance(address userAddress) public view returns (uint256) {
        return (balances[userAddress] * ceth.exchangeRateStored()) / 1e18;
    }
    // function withdraw that allows users to withdraw funds.

    function withdraw() public payable {
        address payable withdrawTo = payable(msg.sender);
        uint amountToTransfer = getBalance(msg.sender);

        totalContractBalance = totalContractBalance - amountToTransfer;
        balances[msg.sender] = 0;
        ceth.redeem(getBalance(msg.sender));
    }

    function addMoneyToContract() public payable {
        totalContractBalance += msg.value;
    }
}
