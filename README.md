# ETH Functions Frontend

A decentralized application (DApp) that allows users to interact with an Ethereum smart contract to deposit, withdraw, pause, and resume operations. The frontend is built with React, and the smart contract is written in Solidity.

## Features

- **Connect MetaMask**: Connect your MetaMask wallet to interact with the ATM.
- **Deposit Ether**: Deposit a specified amount of Ether into the contract.
- **Withdraw Ether**: Withdraw a specified amount of Ether from the contract.
- **Pause Contract**: Pause the contract to prevent further deposits and withdrawals.
- **Resume Contract**: Resume the contract to allow deposits and withdrawals.
- **Error Handling**: Displays error messages from smart contract interactions on the frontend.
- **Contract State Display**: Shows whether the contract is paused or resumed.

## Starter Next/Hardhat Project

After cloning the GitHub repository, follow these steps to get the code running on your computer:

1. Inside the project directory, in the terminal type: `npm i`
2. Open two additional terminals in your VS Code
3. In the second terminal type: `npx hardhat node`
4. In the third terminal, type: `npx hardhat run --network localhost scripts/deploy.js`
5. Back in the first terminal, type `npm run dev` to launch the front-end.

After this, the project will be running on your localhost, typically at [http://localhost:3000](http://localhost:3000).

## Authors

Mia Enciso

