
# Getting a real interest rate

## Introduction
In This Quest () we looked at how to create a bank account that actually allows you to earn an interest. You could deposit Ethers into the smart bank account and after some time withdraw it along with an additional interest rate.

## Getting Started
To deploy the SmartBankAccount contract, follow these steps:

1. Install [Metamask](https://metamask.io/) and connect it to the Ethereum Ropsten Test Network.
2. Deploy the contract using Remix or your preferred development environment.
3. Interact with the contract using the provided functions.

## Features

### `addBalance()`
- Allows users to deposit Ether into their account and earn interest.

### `getBalance(address userAddress) returns(uint)`
- Returns the balance of the specified user, including the interest earned.

### `withdraw()`
- Allows users to withdraw their balance plus any accrued interest.

### `addMoneyToContract()`
- Allows anyone to add Ether to the contract's balance.

## Compound Finance Integration
This contract utilizes Compound Finance to earn interest on deposited Ether.

### `cETH` Interface
- This contract uses the `cETH` interface to interact with Compound's cETH token.

### `mint()`
- Deposits Ether to Compound and mints cETH tokens.

### `redeem(uint redeemTokens)`
- Redeems cETH tokens for Ether from Compound.

### `exchangeRateStored()`
- Returns the current exchange rate of cETH to Ether.

### `balanceOf(address owner)`
- Returns the balance of cETH tokens for the given owner.

## Simple Interest Calculation
The interest on deposits is calculated using Compound Finance's interest model.

## Functions

### `getContractBalance() returns(uint)`
- Returns the total balance of the SmartBankAccount contract.

### `addBalance()`
- Function to deposit Ether into the user's account and earn interest.

### `getBalance(address userAddress) returns(uint)`
- Function to retrieve the balance of the specified user, including the interest earned.

### `withdraw()`
- Function to withdraw the balance plus interest of the caller.

### `addMoneyToContract()`
- Function to add Ether to the contract's balance.

## Configuration
- `COMPOUND_CETH_ADDRESS`: Address of the cETH token contract on the Ethereum network.

## License
This project is licensed under the terms of the MIT license.

## Note
This smart contract is implemented with educational purposes and should not be used in a production environment without comprehensive testing and auditing.
