pragma solidity ^0.8.20;

/**
 * @title  PushCore v2.5
 * @author Push Protocol
 * @notice Push Core is the main protocol that deals with the imperative
 *         features and functionalities like Channel Creation, pushChannelAdmin etc.
 *
 * @dev This protocol will be specifically deployed on Ethereum Blockchain while the Communicator
 *      protocols can be deployed on Multiple Chains.
 *      The Push Core is more inclined towards the storing and handling the Channel related functionalties.
 *
 */
import { PushCoreStorageV1_5 } from "../PushCore/PushCoreStorageV1_5.sol";
import { PushCoreStorageV2 } from "../PushCore/PushCoreStorageV2.sol";

import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import { SafeERC20 } from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import { PausableUpgradeable, Initializable } from "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";

contract PushCoreMock is Initializable, PushCoreStorageV1_5, PausableUpgradeable, PushCoreStorageV2 {
    using SafeERC20 for IERC20;

    /* ***************
        INITIALIZER
    *************** */

    function initialize(
        address _pushChannelAdmin,
        address _pushTokenAddress,
        address _wethAddress,
        address _uniswapRouterAddress,
        address _lendingPoolProviderAddress,
        address _daiAddress,
        address _aDaiAddress,
        uint256 _referralCode
    )
        public
        initializer
        returns (bool success)
    {
        // setup addresses
        pushChannelAdmin = _pushChannelAdmin;
        governance = _pushChannelAdmin; // Will be changed on-Chain governance Address later
        FOUNDATION = _pushChannelAdmin;
        aDaiAddress = _aDaiAddress;
        WETH_ADDRESS = _wethAddress;
        REFERRAL_CODE = _referralCode;
        PUSH_TOKEN_ADDRESS = _pushTokenAddress;
        UNISWAP_V2_ROUTER = _uniswapRouterAddress;
        lendingPoolProviderAddress = _lendingPoolProviderAddress;

        FEE_AMOUNT = 10 ether; // PUSH Amount that will be charged as Protocol Pool Fees
        MIN_POOL_CONTRIBUTION = 50 ether; // Channel's poolContribution should never go below MIN_POOL_CONTRIBUTION
        ADD_CHANNEL_MIN_FEES = 50 ether; // can never be below MIN_POOL_CONTRIBUTION

        ADJUST_FOR_FLOAT = 10 ** 7;
        WALLET_TOTAL_SHARES =100_000 * 1e18;
        WalletToShares[FOUNDATION] = WALLET_TOTAL_SHARES;
        // Create Channel
        success = true;
    }
}
