# SmartBankAccount

## Introduction
SmartBankAccount is a simple Solidity smart contract implementing a bank account-like system on the Ethereum blockchain. This contract allows users to deposit, withdraw, and calculate interest on their deposits.

## Getting Started
To deploy the SmartBankAccount contract, follow these steps:

1. Install [Metamask](https://metamask.io/) and connect it to the Ethereum Ropsten Test Network.
2. Deploy the contract using Remix or your preferred development environment.
3. Interact with the contract using the provided functions.

## Features

### `addBalance()`
- Allows users to deposit Ether into their account.

### `getBalance(address userAddress) returns(uint)`
- Returns the balance of the specified user, including the interest earned.

### `withdraw()`
- Allows users to withdraw their balance plus any accrued interest.

### `addMoneyToContract()`
- Allows anyone to add Ether to the contract's balance.

## Simple Interest Calculation
The interest on deposits is calculated using the formula:


Interest = Principal * Rate * Time


Where:
- `Principal` is the initial deposit.
- `Rate` is the interest rate per year.
- `Time` is the time the deposit has been held (in seconds).

## Functions

### `getContractBalance() returns(uint)`
- Returns the total balance of the SmartBankAccount contract.

### `addBalance()`
- Function to deposit Ether into the user's account.

### `getBalance(address userAddress) returns(uint)`
- Function to retrieve the balance of the specified user.

### `withdraw()`
- Function to withdraw the balance plus interest of the caller.

### `addMoneyToContract()`
- Function to add Ether to the contract's balance.

## License
This project is licensed under the terms of the MIT license.

## Note
This smart contract is implemented with educational purposes and should not be used in a production environment without comprehensive testing and auditing.
