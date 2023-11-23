pragma solidity ^0.8.20;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";

import "contracts/token/EPNS.sol";
import "contracts/interfaces/IUniswapV2Router.sol";
import { PushCoreV2_5 } from "contracts/PushCore/PushCoreV2_5.sol";
import { PushCommV2_5 } from "contracts/PushComm/PushCommV2_5.sol";

import { Actors } from "./utils/Actors.sol";
import { Constants } from "./utils/Constants.sol";

abstract contract BaseTest is Test, Constants {
    EPNS public pushToken;
    PushCoreV2_5 public core;
    PushCommV2_5 public comm;
    IUniswapV2Router public uniV2Router;

    /* ***************
        Main Actors in Test
     *************** */
    Actors internal actor;
    address tokenDistributor;

    /* ***************
       Initializing Set-Up for Push Contracts
     *************** */

    function setUp() public virtual {
        tokenDistributor = makeAddr("tokenDistributor");

        pushToken = new EPNS(tokenDistributor);
        core = new PushCoreV2_5();
        comm = new PushCommV2_5();
        uniV2Router = IUniswapV2Router(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);

        actor = Actors({
            admin: createActor("admin"),
            governance: createActor("governance"),
            bob_channel_owner: createActor("bob_channel_owner"),
            alice_channel_owner: createActor("alice_channel_owner"),
            charlie_channel_owner: createActor("charlie_channel_owner"),
            tony_channel_owner: createActor("tony_channel_owner"),
            dan_push_holder: createActor("dan_push_holder"),
            tim_push_holder: createActor("tim_push_holder")
        });

        // Initialize Core Contract
        core.initialize(
            actor.admin,
            address(pushToken),
            address(0), // WETH Address
            address(uniV2Router), // Uniswap_Router
            address(0), // Lending_Pool_Aave
            address(0), // Dai_Address
            address(0), // aDai address
            0
        );

        // Initialize Comm Contract
        comm.initialize(actor.admin, "FOUNDRY_TEST_NETWORK");

        vm.prank(tokenDistributor);
        pushToken.transfer(address(core), 1 ether);
        // Set-up Core Address in Comm & Vice-Versa
        vm.startPrank(actor.admin);
        comm.setEPNSCoreAddress(address(core));
        core.setEpnsCommunicatorAddress(address(comm));
        vm.stopPrank();
        // Wrapping to exact timestamp of Core and Comm Deployment
        vm.warp(DEC_27_2021);
    }

    /* ***************
       Core Contract Helper Functions
    *************** */

    function roll(uint256 num) internal {
        vm.roll(num);
    }

    function approveTokens(address from, address to, uint256 amount) internal {
        vm.startPrank(from);
        pushToken.approve(to, amount);
        pushToken.setHolderDelegation(to, true);
        vm.stopPrank();
    }

    function createActor(string memory name) internal returns (address payable) {
        address payable _actor = payable(makeAddr(name));
        // Transfer 50 eth to every actor
        vm.deal({ account: _actor, newBalance: 50 ether });
        // Transfer 50K PUSH Tokens for every actor
        vm.prank(tokenDistributor);
        pushToken.transfer(_actor, 50_000 ether);
        // Approve tokens for Core Contract
        approveTokens(_actor, address(core), 50_000 ether);
        return _actor;
    }
}
