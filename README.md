<h1 align="center">
    <a href="https://push.org/#gh-light-mode-only">
    <img width='20%' height='10%' src="https://res.cloudinary.com/drdjegqln/image/upload/v1686227557/Push-Logo-Standard-Dark_xap7z5.png">
    </a>
    <a href="https://push.org/#gh-dark-mode-only">
    <img width='20%' height='10%' src="https://res.cloudinary.com/drdjegqln/image/upload/v1686227558/Push-Logo-Standard-White_dlvapc.png">
    </a>
</h1>

<p align="center">
  <i align="center">Push Protocol is a web3 communication network, enabling cross-chain notifications and messaging for dapps, wallets, and services.🚀</i>
</p>

<h4 align="center">

  <a href="https://discord.gg/pushprotocol">
    <img src="https://img.shields.io/badge/discord-7289da.svg?style=flat-square" alt="discord">
  </a>
  <a href="https://twitter.com/pushprotocol">
    <img src="https://img.shields.io/badge/twitter-18a1d6.svg?style=flat-square" alt="twitter">
  </a>
  <a href="https://www.youtube.com/@pushprotocol">
    <img src="https://img.shields.io/badge/youtube-d95652.svg?style=flat-square&" alt="youtube">
  </a>
</h4>

# Push Protocol Smart Contracts

Welcome to the repository for the smart contracts of the Push Protocol. This repository contains the core code that powers our decentralized communication network. The Push Protocol is a web3 communication protocol that enables cross-chain notifications and messaging for decentralized applications (dApps), wallets, and services.

Our smart contracts are the backbone of the Push Protocol, enabling the functionality that allows for on-chain and off-chain communication via user wallet addresses. This is done in an open, gasless, multichain, and platform-agnostic fashion.

In this repository, you will find the contracts that handle various aspects of the Push Protocol, from channel creation and verification to notification sending and subscription handling. We also provide a suite of tests to ensure the robustness and security of our contracts.

We invite you to explore, contribute, and help us build the future of web3 communication.



---

## 📚 Table of Contents
- [Smart Contract Address](#smart-contract-addresses)
- [Modules](#-modules)
- [Getting Started/Installation](#getting-started)
- [Resources](#resources)
- [Contributing](#contributing)


## Smart Contract Addresses 

Here is Contract addresses for Eth Mainnet. You can find addresses for other networks over at our <a href="https://docs.push.org/developers/developer-tooling/push-smart-contracts/epns-contract-addresses">Docs</a>  

| Contract Name | Contract Address |
| ------------- | ---------------- |
| Push Token | 0xf418588522d5dd018b425E472991E52EBBeEEEEE |
| EPNS CoreV1.5 | 0x66329Fdd4042928BfCAB60b179e1538D56eeeeeE |
| EPNS CommV1.5 | 0xb3971BCef2D791bc4027BbfedFb47319A4AAaaAa |

## 🧩 Modules

<details closed><summary>Benchmarks</summary>

| File                         | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | Module                                       |
|:-----------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:---------------------------------------------|
| EPNSCoreV1.Benchmark.test.js | The code snippet initializes and runs benchmarks to test the functionality of the EPNS smart contract. The tests involve creating channels and adding whitelisted addresses. The contract is deployed using a proxy contract, with arguments passed via arrays and functions executed using the AsyncFunction constructor. The aim is to test the time taken for each function to execute. The benchmarks are run against three different versions of the contract, allowing for comparisons on changes in functionality. | test/benchmarks/EPNSCoreV1.Benchmark.test.js |

</details>

<details closed><summary>Common</summary>

| File             | Summary                                                                                                                                                                                                                                                                                                                                                                                                         | Module                       |
|:-----------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-----------------------------|
| expect.js        | This code defines a Chai assertion library and uses it to test solidity code on the Ethereum blockchain through the Ethereum Waffle package. It exports the'expect' function for use in testing.                                                                                                                                                                                                                | test/common/expect.js        |
| fixtures.js      | The provided code snippet offers two fixtures-`epnsContractFixture` and `tokenFixture`-for testing smart contracts related to Ethereum Push Notification Service (EPNS). The `epnsContractFixture` returns several proxies and contracts required for EPNS, while `tokenFixture` returns a mock Dai contract. The code also defines several constants needed for the EPNS deployment and deployment parameters. | test/common/fixtures.js      |
| fixtures_temp.js | The provided code snippet consists of two async functions. The first function deploys an instance of an EPNS contract, along with several other contracts. The second function sets up a token fixture that includes a mock DAI token and the ADAI contract. These functions are exported for use in testing and development environments.                                                                      | test/common/fixtures_temp.js |

</details>

<details closed><summary>Epnscomm</summary>

| File                    | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                                    | Module                                     |
|:------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-------------------------------------------|
| EPNSCommV1.sol          | This code is the implementation of the EPNS Communicator protocol, which is a communication layer between end users and the EPNS Core Protocol. It allows users to subscribe to channels, unsubscribe from channels, and send notifications to specific recipients or all subscribers of a channel.|
|                         ||                                            |
| EPNSCommStorageV1_5.sol | This Solidity code defines a contract for storing and managing user data in the Ethereum Push Notification Service (EPNS) protocol. It includes a User struct for organizing data about users and several mappings that track user and channel subscriptions. The contract also includes state variables for governance, user count, and more.                                                                                                             | contracts/EPNSComm/EPNSCommStorageV1_5.sol |
| EPNSCommAdmin.sol       | This code snippet is a Solidity contract that extends the ProxyAdmin contract from the OpenZeppelin library. Its main functionality is to serve as a proxy administrator for a smart contract system, allowing the updating and upgrading of contracts in the system, while maintaining the same deployment address and keeping the contract functionalities intact. The SPDX-License-Identifier is also included, specifying the open-source MIT license. | contracts/EPNSComm/EPNSCommAdmin.sol       |
| EPNSCommProxy.sol       | The provided Solidity contract is an implementation of a transparent upgradeable proxy using the OpenZeppelin library. It takes in parameters for the contract's logic, governance address, push-channel admin address, and chain name as part of its constructor function. Upon initialization, the contract transparently proxies its functionality, allowing future upgrades and modifications without breaking functionality or requiring migrations.  | contracts/EPNSComm/EPNSCommProxy.sol       |
| EPNSCommV1_5.sol        | This code defines the storage contract for the EPNS Communicator protocol version 1.5. It includes the user struct and mappings to track user details, subscriptions, notification settings, and delegated notification senders. It also includes state variables for governance, push channel admin, chain ID, user count, migration status, EPNS Core address, chain name, and type hashes for various types of transactions. | contracts/EPNSComm/EPNSCommV1_5.sol        |
|                         ||                                            |

</details>

<details closed><summary>Epnscore</summary>

| File                    | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | Module                                     |
|:------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-------------------------------------------|
| EPNSCoreV1.sol          | The code is a smart contract implementation called "EPNSCoreV1" for a decentralized notification protocol. It includes functionalities such as creating and managing channels, channel verification, depositing and withdrawing funds, and fair share ratio calculations for distributing rewards. | contracts/EPNSCore/EPNSCoreV1.sol          |
|                         ||                                            |
| EPNSCoreProxy.sol       | The code defines a contract EPNSCoreProxy that extends the TransparentUpgradeableProxy to enable transparent and secure upgrades. It uses the constructor to set various parameters, such as logic contract, governance address, WETH and DAI addresses, and initialization parameters by encoding values using abi.encodeWithSignature().                                                                                                                                                 | contracts/EPNSCore/EPNSCoreProxy.sol       |
| EPNSCoreStorageV2.sol   | The provided code defines a contract called EPNSCoreStorageV2 that has three state variables. It defines two types of byte32 hash constants and mappings for nonces, channel update counters and rewards claimed by addresses for channel creation. It specifies the Solidity compiler version to be used as greater than or equal to 0.6.0 and less than 0.7.0.                                                                                                                           | contracts/EPNSCore/EPNSCoreStorageV2.sol   |
| EPNSCoreAdmin.sol       | The code defines a contract called EPNSCoreAdmin that imports "ProxyAdmin" from the "@openzeppelin/contracts/proxy/" package. The contract defines no behavior of its own and essentially acts as a forwarding service that allows an admin to upgrade other contacts via a proxy. It is licensed under MIT.                                                                                                                                                                               | contracts/EPNSCore/EPNSCoreAdmin.sol       | 
| TempStorage.sol         | The provided code is for a Solidity smart contract called TempStorage, which serves as a temporary storage for channels whose poolContribution and weight have been updated. It uses a mapping data structure to keep track of updated channels and has two functions that allow users to check if a channel has been adjusted and to mark a channel as adjusted, respectively. The constructor function sets the Core_Address of the contract and requires that it be a non-zero address. | contracts/EPNSCore/TempStorage.sol         |
| EPNSCoreStorageV1_5.sol | This Solidity contract defines the storage layout for an Ethereum Push Notification Service (EPNS). It includes various enums, constants, mappings, and state variables to keep track of channels created by users, historical data, fair share ratios, fee calculations, and more.                                                                                                                                                                                                        | contracts/EPNSCore/EPNSCoreStorageV1_5.sol |

</details>

<details closed><summary>Governance</summary>

| File                        | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | Module                                           |
|:----------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-------------------------------------------------|
| GovernorBravo.sol           | This defines the implementation of a decentralized governance contract called "Governor Bravo." It allows token holders to propose and vote on proposals for protocol changes, with specific rules such as voting thresholds, voting periods, and quorum requirements.| contracts/governance/GovernorBravo.sol           |
| VerzionedInitializable.sol  | The provided code snippet is a helper contract that supports initializer functions. It includes a modifier for use in the contract's initializer function, a function for returning the revision number of the contract, and a private function for detecting if a function is running in the constructor or not. It is based on the OpenZeppelin Initializable contract.                                                                                                                                                                                                                                                                | contracts/governance/VerzionedInitializable.sol  |
| Timelock.sol                | This code snippet may be used as a secure and safe library to perform arithmetic operations on unsigned integers in Solidity smart contracts. The code ensures that the more complex mathematical operations such as addition, subtraction, multiplication, division, and modular calculations do not exceed limits or the size of the uint data type. It also has built-in error management functions to provide detailed codes and logic errors messages for easier debugging. The remaining part of the code is smart-contract related, implementing a timelock module to set in places consistent custom ETH transactions schedules. | contracts/governance/Timelock.sol                |
| GovernorBravoInterfaces.sol | The given code implements the storage and events for the Governor Bravo contract, which is designed for decentralized governance using voting proposals. It includes functionalities for creating, voting, canceling, queuing, and executing proposals with various parameters such as a voting delay, voting period, and proposal threshold. The Timelock and EPNS contracts are a part of the implementation and facilitate time-based delays and token-based votes, respectively.                                                                                                                                                     | contracts/governance/GovernorBravoInterfaces.sol |
| EPNSBravoProxy.sol          | The code defines a Solidity contract named EPNSBravoProxy that inherits from TransparentUpgradeableProxy. It enables upgrades of contracts by storing the contract's address while launching an upgradeable version of it. The contract takes in several parameters upon implementation, which can change important factors, functionality and voting behavior of each upgrade.                                                                                                                                                                                                                                                          | contracts/governance/EPNSBravoProxy.sol          |

</details>

<details closed><summary>Helpers</summary>

| File     | Summary                                                                                                                       | Module           |
|:---------|:------------------------------------------------------------------------------------------------------------------------------|:-----------------|
| utils.js | This code provides a collection of helper functions and constants for deploying and interacting with smart contracts. It includes functions for deploying contracts, distributing funds, verifying contracts, calculating fair share values, and extracting a wallet from a mnemonic.' | helpers/utils.js |

</details>

<details closed><summary>Interfaces</summary>

| File                              | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                    | Module                                                 |
|:----------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-------------------------------------------------------|
| IPUSH.sol                         | The provided code is an interface for an ERC20-like token contract called IPUSH. It defines four functions that can be implemented by the contract: born() returns the block number when the token was created, totalSupply() returns the total supply of the token, resetHolderWeight() resets the token holder's weight, and returnHolderUnits() returns the number of tokens held by an account at a particular block number.           | contracts/interfaces/IPUSH.sol                         |
| IEPNSCore.sol                     | This code snippet declares an interface in Solidity called "IEPNSCore". It doesn't contain any actual code or functionality, but rather acts as a definition that other contracts can use to interact with contracts that implement the functions and variables defined in this interface. It specifies that the contract implementing this interface should use a version of Solidity greater than or equal to 0.6.0 but less than 0.7.0. | contracts/interfaces/IEPNSCore.sol                     |
| IEPNSCommV1.sol                   | The provided code snippet defines an interface for the IEPNSCommV1 contract that includes two external functions. The first function, subscribeViaCore, allows a user to subscribe to a channel by passing in the channel and user addresses. The second function, unSubscribeViaCore, allows a user to unsubscribe from a previously subscribed channel by passing in the channel and user addresses.                                     | contracts/interfaces/IEPNSCommV1.sol                   |
| ITempStorage.sol                  | The provided code snippet defines an interface for a TempStorage contract that allows the Core Contract to flag channel addresses with complete adjustments as true using the function setChannelAdjusted. The function isChannelAdjusted returns the status of adjustment for a given channel address.                                                                                                                                    | contracts/interfaces/ITempStorage.sol                  |
| IERC1271.sol                      | The provided code snippet is an interface implementation of the ERC1271 standard signature validation method in Solidity. It defines a single function'isValidSignature' which accepts a hash and signature as input parameters and returns a magic value. This interface is intended to verify that a signature attachment in a digital certificate of smart contracts is associated with the correct data.                               | contracts/interfaces/IERC1271.sol                      |

</details>

<details closed><summary>Loaders</summary>

| File                   | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | Module                         |
|:-----------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-------------------------------|
| envVerifier.js         | This code exports a function that verifies and generates an environment file by checking for its presence, reading a version-controlled sample file, prompting the user with any variables not found in the environment file, and building the real environment file by appending real environment variable values entered by the user. The function returns null when the environment is verified or generated. The'chalk' package outputs pretty terminal messages, and the script has the option to fail or log on non-verification of environment variables.        | loaders/envVerifier.js         |
| versionVerifier.js     | This code snippet provides a set of functions to verify and upgrade a version of a configuration file, using properties of said file and verified parameters. The code reads a contract configuration file in json format and checks a version history. If there is a version upgrade, it makes necessary JSON changes to double-check the data, overwriting parameters read previously, thus keeping errors at bay. The file mostly relies on third-party of close source modules and deals extensively with monitoring and reporting errors generated in the process. | loaders/versionVerifier.js     |
| tokenAmountVerifier.js | This code snippet exports a function "verifyTokensAmount", which uses the "DISTRIBUTION_INFO" constant to calculate the total distributed token amount and verify if it matches the expected total. The function achieves this by recursively iterating over the "DISTRIBUTION_INFO" object and returns an error and exits the process if the total amount is incorrect. The code utilises the "chalk" library for formatting output to the console.                                                                                                                    | loaders/tokenAmountVerifier.js |

</details>

<details closed><summary>Mocks</summary>

| File                     | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | Module                                   |
|:-------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-----------------------------------------|
| IUniswapV2RouterMock.sol | The provided code snippet is a Solidity interface for the UniswapV2RouterMock contract. It defines two function signatures: swapExactTokensForTokens for swapping tokens and getAmountsOut for calculating the expected output amounts when swapping tokens. The provided interface acts as a blueprint for any contract implementing the UniswapV2RouterMock interface, allowing them to interact with other contracts that require this functionality.                                        | contracts/mocks/IUniswapV2RouterMock.sol |
| MockERC1271.sol          | The provided code defines the "SignatureVerifier" contract, which verifies whether a given signature is valid for a specified hash corresponding to the contract's owner address. The contract uses the openzeppelin ECDSA library and supports the ERC1271 standard for signature validation. The "supportsStaticCall" function checks whether a given method ID belongs to the ERC1271 interface, while the "isValidSignature" function verifies if the signature matches the expected owner. | contracts/mocks/MockERC1271.sol          |
| MockDai.sol              | The code provides a smart contract that allows for the minting of ERC20 tokens and is used as a mock version of DAI stablecoin. The `MintableERC20` abstract contract, derived from `ERC20`, enables tokens to be minted and the `MockDAI` contract inherits from it with the name "DAI" and ticker "DAI". This contract could be used in place of real DAI tokens for testing and development of decentralized applications.                                                                   | contracts/mocks/MockDai.sol              |

</details>

<details closed><summary>Root</summary>

| File              | Summary                                                                                                                                                                                                                                                                                                                                                                                                                      | Module            |
|:------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:------------------|
| hardhat.config.js | The provided code snippet defines default networks and loads required libraries in a Hardhat environment for Ethereum smart contract development. It includes tasks to generate a mnemonic, get account information and balance, and send ETH. The environment can be configured for various blockchain networks including mainnet, testnet and local networks. It also includes an Etherscan API key for code verification. | hardhat.config.js |
| license-v1        | The provided code snippet is the license text for the Business Source License 1.1. The license gives the right to copy, modify, create derivative works, and redistribute the Push Protocol, subject to certain conditions and limitations. It includes terms regarding a Change License and specifies covenants required by the Licensor.                                                                                   | license-v1        |
| app.js            | This code snippet uses the chalk library to display a completion message and prompt for the user to run a command. Additionally, it loads an environment verifier module and awaits its execution before displaying the messages.                                                                                                                                                                                            | app.js            |

</details>

<details closed><summary>Scripts</summary>

| File                         | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | Module                               |
|:-----------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-------------------------------------|
| 1_deployEPNSCoreV1.js        | The provided code snippet imports various dependencies and defines helper functions for deploying and verifying contracts. It also defines the `main` function, which runs version checks, deploys contracts, verifies contracts, and upgrades the version. The `setupAllContracts` function handles the deployment of various contracts and returns the list of deployed contracts.                                                                                                                        | scripts/1_deployEPNSCoreV1.js        |
| 1_5_deployEPNSCoreV1_5.js    | The code is a Node.js script that uses the Hardhat framework to deploy and upgrade Ethereum smart contracts. It requires other modules such as `fs` and `chalk` and includes helper functions such as `deployContract()` and `verifyAllContracts()`. The `main()` function deploys, verifies, and upgrades multiple contracts and conducts version control checks.                                                                                                                                          | scripts/1_5_deployEPNSCoreV1_5.js    |
| 4_deployEPNSCommV2.js        | The code snippet deploys, verifies and upgrades Ethereum smart contracts using Hardhat framework. It imports several modules such as fs and chalk, and utilizes a versionVerifier to verify version control, an upgradeVersion function to upgrade versions of contracts, and various utils functions. Using ethers, it deploys a specific smart contract and a factory class generates contact instances, which are then upgraded to run via ethers.                                                       | scripts/4_deployEPNSCommV2.js        |
| 0_deploySample.js            | The code checks and upgrades a version, deploys all necessary contracts, and verifies them. It imports required modules and calls related functions. EPNS contracts are deployed based on arguments passed, upgraded and subsequently verified. Finally, a'process exit' command is run to terminate the functions of the code.                                                                                                                                                                             | scripts/0_deploySample.js            |
| 2_5_deployEPNSCommV1_5.js    | This code snippet deploys and upgrades smart contracts using Hardhat. It includes a version check, contract deployment, verification, and version upgrade. It also utilizes helper functions to assist with deployment, including the ability to dynamically deploy contracts using arguments files. The code utilizes chalk for logging and reporting purposes.                                                                                                                                            | scripts/2_5_deployEPNSCommV1_5.js    |
| 6_deployEPNSCommV3.js        | The code defines an async function, `main()`, that deploys and verifies contracts, upgrades their version, and completes a version check. It uses various functions and modules, including `fs`, `chalk`, and the `hardhat` module's `config` and `ethers` objects. Additionally, it calls `setupAllContracts()` to handle deployment specifics and receives `deployedContracts` as an array of contracts. The main() function is an entry point that runs when the larger application or script is called. | scripts/6_deployEPNSCommV3.js        |
| 2_deployEPNSCommV1.js        | The code defines the main function that deploys multiple smart contracts using the Hardhat framework with support for the version control of each contract, and upgrades them for the Ethereum blockchain ecosystem. The function also handles the verification of each contract's deployment through the verificationAllContracts function. The deployed contract details are logged onto the console using Chalk for easy readability.                                                                    | scripts/2_deployEPNSCommV1.js        |
| 7_polygonDeployEPNSCommV1.js | This code sets up and deploys smart contracts for the EPNS communication protocol using Hardhat. It uses version control, deploys the contracts and verifies the deployment, and upgrades the version after deployment. The `setupAllContracts` function deploys the contracts specified in its parameters and returns their addresses.                                                                                                                                                                     | scripts/7_polygonDeployEPNSCommV1.js |
| 5_deployEPNSCoreV3.js        | The code creates a script that first checks the version of the contracts being used for decentralized operation, then deploys and verifies them if they are valid. The script then upgrades the contracts' versions if needed, using Hardhat and Fastify as development platforms where serverless functions can be run without using servers. Finally, the script logs the results of each stage of the deployment and version control process.                                                            | scripts/5_deployEPNSCoreV3.js        |
| 3_deployEPNSCoreV2.js        | This code snippet deploys, verifies, and upgrades smart contracts on Ethereum using the Hardhat framework. It also has functions for contract version verification, reading from argument files, and printing colored console logs. The main() function calls the setupAllContracts() function, which deploys smart contracts and returns their addresses. It then upgrades the EPNSCoreV2 contract and aborts or succeeds the process based on the result of the promises returned.                        | scripts/3_deployEPNSCoreV2.js        |
| temp_deployEPNSCoreV1_5.js   | The code sets up a system for upgrading contracts via utilizing the Hardhat development environment and `ethers.js` package. It deploys contracts, verifies their deployment and upgrades the existing contract version with the latest version. The version upgrade function listens in to the EPNSEventsManager contract and mirrors emissions from an old contract to a new one.                                                                                                                         | scripts/temp_deployEPNSCoreV1_5.js   |
| 8_polygonDeployEPNSCommV2.js | The code uses NodeJS and Hardhat to deploy contracts, verify them, and upgrade versions. It imports external modules such as FS (File System) and Chalk (Terminal Styling). The `setupAllContracts` function deploys specific contracts, upgrades them and returns those that were deployed. Overall, `main` controls the execution order and prints logs using Chalk to show the user what is happening.                                                                                                   | scripts/8_polygonDeployEPNSCommV2.js |

</details>

<details closed><summary>Test</summary>

| File    | Summary                                                                                                                                                                                                                                                                                                                                                                                                                     | Module       |
|:--------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-------------|
| time.js | This code snippet provides various functions for interacting with the Ganache network, including advancing the block, increasing time, and retrieving block data. The code utilizes the BN.js library for handling big numbers and the ethers.js library for interacting with the Ethereum network. The duration object also provides a convenient way to convert time periods into seconds for use in the other functions. | test/time.js |

</details>

<details closed><summary>Token</summary>

| File      | Summary                                                                                                                                                                                                              | Module                    |
|:----------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------------------------|
| EPNS.sol  | This code implements the token "EPNS" (Ethereum Push Notification Service) based on the ERC-20 standard. It provides functionalities for token transfers, approvals, voting delegation, and burning tokens. The contract also includes mechanisms to calculate and adjust holder weights based on token balances. | contracts/token/EPNS.sol  |
| EPNS.args | The provided code snippet is an array containing a string of hex code which represents a Ethereum address on the blockchain network. This is a basic storage structure used to write the address on smart contracts. | contracts/token/EPNS.args |

</details>

<details closed><summary>V1</summary>

| File                                  | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | Module                                        |
|:--------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:----------------------------------------------|
| EPNSCommV1.MigrateSubscribers.js      | The provided code implements a smart contract protocol for EPNS COMMUNICATOR. It includes various functionalities such as migratory subscription data testing, setting up contract addresses, processing migrations, and using formatted APIs for blockchains. The code has detailed descriptions of various functions it supports such as addUser, subscribe data migration, and state variable updates.                                                                                  | test/v1/EPNSCommV1.MigrateSubscribers.js      |
| EPNSCoreV1.ChannelActivationCycles.js | This code represents tests for the EPNS Core Protocol. It covers various scenarios related to channel deactivation, reactivation, and blocking, and verifies the correct execution of functions, updates to channel details, pool balances, and fair share ratios. | test/v1/EPNSCoreV1.ChannelActivationCycles.js |
| EPNSCommV1.SendNotifs.js              | The code snippet sets up a testing environment for the EPNS COMMUNICATOR Protocol including importing dependencies and defining contracts properties. The code also runs tests on the send notification function checking that notifications are properly sent to recipients and rejected if invalid channels, recipients or delegates; the tests also emit event logs to verify proper logic execution.                                                                                   | test/v1/EPNSCommV1.SendNotifs.js              |
| EPNSCommV1.Subscribers.js             | This code is a test suite for the EPNS COMMUNICATOR protocol. It tests various functionalities such as subscribing to channels, unsubscribing from channels, setting user notification settings, and broadcasting user public keys. | test/v1/EPNSCommV1.Subscribers.js             |
| EPNSCoreV1.Basic.js                   | The code snippet provides several functionalities for testing the EPNS Core Protocol, including defining various constants, initializing contracts and signers, and testing the basics of the core and communicator protocols. It also uses external packages like Chai and Ethereum-waffle for testing, and custom helper functions for calculations. The code primarily focuses on testing channel-related functions.                                                                    | test/v1/EPNSCoreV1.Basic.js                   |
| EPNSCoreV1.ChannelCreation.js         | This code is a test suite written using the Chai testing framework for the EPNS (Ethereum Push Notification Service) Core Protocol. It tests various functionalities such as channel creation, fee transfers, state variable updates, interaction with the EPNS Communicator, and event emissions.| test/v1/EPNSCoreV1.ChannelCreation.js         |
| EPNSCoreV1.readjustFSFunction.js      |This code is a test suite for the EPNS Core Protocol, which is a smart contract system for decentralized push notifications. It includes tests for various channel creation scenarios and the adjustment of fair share variables based on channel actions such as addition, deactivation, reactivation, and blocking.| test/v1/EPNSCoreV1.readjustFSFunction.js      |
| EPNSCoreV1.ChannelCreationForAdmin.js | The provided code snippet tests functions for the EPNS Core Protocol, a smart contract system that facilitates communication between Ethereum applications and their users. The tests cover the creation of channels for the push channel admin and EPNS alerter, interactions between the EPNS Core and EPNS Communicator contracts, and ensuring that certain functions can only be called by authorized parties. The tests use Solidity, Chai, and the Hardhat development environment. | test/v1/EPNSCoreV1.ChannelCreationForAdmin.js |
| EPNSCoreV1.MigrateChannels.js         | This code is a test suite for the EPNS CORE protocol. It tests various functions related to channel data migration, including reverting conditions, depositing funds, creating channels, updating state variables, and interacting with the EPNS Communicator contract. | test/v1/EPNSCoreV1.MigrateChannels.js         |
| EPNSCoreV1.ChannelVerification.js     | This code is a test suite written in JavaScript using the Chai testing framework. It tests the channel verification functionality of an EPNS (Ethereum Push Notification Service) smart contract. The tests cover scenarios such as verifying and unverifying channels, propagating verification to secondary channels, and batch verification and unverification. | test/v1/EPNSCoreV1.ChannelVerification.js |

</details>

<details closed><summary>V1_5</summary>

| File                                           | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | Module                                                   |
|:-----------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:---------------------------------------------------------|
| EPNSCommV1_5_SendNotification.test.js          | The provided code snippet is a test suite for the EPNS Comm V1_5 Protocol, which involves sending notifications through the EPNS Core system. The tests cover a range of scenarios, including sending notifications to oneself, setting up a channel and adding delegates, and checking that notifications are sent only to approved recipients. The code uses packages such as ethers and waffle for development and testing purposes.                                                                                                                             | test/v1_5/EPNSCommV1_5_SendNotification.test.js          |
| EPNSCoreV1_Temp.AdjustPoolContribution.test.js | This code represents a test suite for the adjustChannelPoolContributions function in an Ethereum smart contract. It verifies that the function correctly updates the pool contributions and weights of channels, assigns the correct channel update block value, and handles various edge cases and conditions.| test/v1_5/EPNSCoreV1_Temp.AdjustPoolContribution.test.js |
| EPNSCoreV1_5.UpdateChannelMeta.test.js         | The code snippet includes unit tests for the EPNS CoreV2 Protocol. The tests focus on the functionality to create and update channels. Various checks have been implemented, such as contract pauseability, the validity of channel owner, minimum funds requirement, and the ability to charge dynamically up to accept certain payment amounts. Testing for correct state transitions and event emission are also undertaken.                                                                                                                                     | test/v1_5/EPNSCoreV1_5.UpdateChannelMeta.test.js         |
| EPNSCoreV1_Temp.Swap.test.js                   | The code snippet tests the functionality of swapping aDai tokens for PUSH tokens in the EPNS (Ethereum Push Notification Service) smart contract. The test cases check for the correct swap values, pausing of contract during the swap, correct admin authorization, and updating of CHANNEL_POOL_FUNDS. The code also imports various modules and sets variables for the transactions.                                                                                                                                                                            | test/v1_5/EPNSCoreV1_Temp.Swap.test.js                   |
| EPNSCoreV1_5.TimeBoundChannel.test.js          | This code is a test suite written in JavaScript for the EPNS CoreV2 Protocol. It tests various functionalities related to channel creation, including creating time-bound channels, destroying channels, refunding users, and verifying channel information.| test/v1_5/EPNSCoreV1_5.TimeBoundChannel.test.js          |
| EPNSCoreV1_5.Pausability.test.js               | The code snippet imports necessary modules and fixtures, defines and executes a series of tests on the EPNS Core protocol's channel creation functionalities and checks for reverts and correct executions. These include reverting on activation of an already active channel, executing only via governance during pausing and unpausing, should block certain functionalities when paused, and the functionality of activating a deactivated channel. Finally, it ensures that subscriptions and funds have been credited and updates state variables correctly. | test/v1_5/EPNSCoreV1_5.Pausability.test.js               |
| EPNSCoreV1_5.ChannelCreationPush.test.js       | The provided code is a test suite for the EPNS CoreV2 protocol which verifies the correctness of its functionalities such as creating a new channel, updating state variables, depositing fees, subscribing to channels, and emitting relevant events. The tests cover both failure and success cases, providing insight into the behavior of the protocol in different scenarios.                                                                                                                                                                                  | test/v1_5/EPNSCoreV1_5.ChannelCreationPush.test.js       |
| EPNSCommV1_5_SubscribeBySig.test.js            | This code is a test suite for the EPNS Comm V1_5 Protocol. It includes tests for channel subscription and unsubscription using EIP 1271 and 712 signatures, checking signature validity, expiration, and nonce. | test/v1_5/EPNSCommV1_5_SubscribeBySig.test.js            |
| EPNSCoreV1_5.OwnershipTransfer.test.js         | This code snippet tests various functionalities related to channel ownership transfer in the EPNS CoreV2 Protocol. The tests include checking validity of the caller, testing when the contract is not paused, updating protocol pool fees accurately on ownership transfer, transferring all Channel details to new Channel, emitting events correctly, etc. It also includes tests to ensure that channel owners can't transfer ownership of any other channel or transfer ownership to an already existing channel.                                              | test/v1_5/EPNSCoreV1_5.OwnershipTransfer.test.js         |
| EPNSCommV1_5_SendNotificationFromSig.test.js   | The code snippet is a test suite for the EIP 1271 and 712 Support functionality of the EPNS Comm V1_5 Protocol. It includes tests for sending channel notification using different types of signatures, delegation, and signature replay/expiry. The code uses Hardhat, Ether.js, and Waffle frameworks to run the tests.                                                                                                                                                                                                                                           | test/v1_5/EPNSCommV1_5_SendNotificationFromSig.test.js   |


</details>

<details closed><summary>Versioncontrol</summary>

| File    | Summary                                                                                                                                                                                                                                                                                                                                                                                                                     | Module       |
|:--------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-------------|
| All Files | Summary explanation of all the files in version control __________ |  |


</details>

<details closed><summary>Wallets</summary>

| File      | Summary                                                                                                                                                                                                                                                                                    | Module            |
|:----------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:------------------|
| !noremove | The code snippet quizzes the user by asking a set of multiple-choice questions. It allows the user to select one of four possible answers by typing out the corresponding letter (A, B, C, or D). After all questions have been answered, the user's results are tallied up and displayed. | wallets/!noremove |

</details>

---

## Getting Started


### 🖥 Installation

1. Clone the push-smart-contracts repository:
```sh
git clone https://github.com/ethereum-push-notification-service/push-smart-contracts
```

2. Change to the project directory:
```sh
cd push-smart-contracts
```

3. Install the dependencies:
```sh
npm install
```

### 🤖 Using push-smart-contracts

```sh
cd contracts
```

### 🧪 Running Tests
```sh
npx hardhat test
```

---

## Resources
- **[Website](https://push.org)** To checkout our Product.
- **[Docs](https://docs.push.org/developers/)** For comprehensive documentation.
- **[Blog](https://medium.com/push-protocol)** To learn more about our partners, new launches, etc.
- **[Discord](discord.gg/pushprotocol)** for support and discussions with the community and the team.
- **[GitHub](https://github.com/ethereum-push-notification-service)** for source code, project board, issues, and pull requests.
- **[Twitter](https://twitter.com/pushprotocol)** for the latest updates on the product and published blogs.


## Contributing

Push Protocol is an open source Project. We firmly believe in a completely transparent development process and value any contributions. We would love to have you as a member of the community, whether you are assisting us in bug fixes, suggesting new features, enhancing our documentation, or simply spreading the word. 

- Bug Report: Please create a bug report if you encounter any errors or problems while utilising the Push Protocol.
- Feature Request: Please submit a feature request if you have an idea or discover a capability that would make development simpler and more reliable.
- Documentation Request: If you're reading the Push documentation and believe that we're missing something, please create a docs request.


Read how you can contribute <a href="https://github.com/ethereum-push-notification-service/push-sdk/blob/main/contributing.md">HERE</a>

<br />
Not sure where to start? Join our discord and we will help you get started!

<a href="discord.gg/pushprotocol" title="Join Our Community"><img src="https://www.freepnglogos.com/uploads/discord-logo-png/playerunknown-battlegrounds-bgparty-15.png" width="200" alt="Discord" /></a>

## License
Check out our License <a href='https://github.com/ethereum-push-notification-service/push-sdk/blob/main/license-v1.md'>HERE </a>



