// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import { BaseCCRTest } from "../../BaseCCR.t.sol";
import { Errors } from ".././../../../contracts/libraries/Errors.sol";
import { console } from "forge-std/console.sol";

contract CreateChatCCR is BaseCCRTest {
    uint256 amount = 100e18;

    function setUp() public override {
        BaseCCRTest.setUp();
        sourceAddress = toWormholeFormat(address(commProxy));
        (_specificPayload, requestPayload) = getSpecificPayload(
            coreProxy.handleChatRequestData.selector, actor.charlie_channel_owner, amount, "channleStr"
        );
    }

    modifier whenCreateChannelIsCalled() {
        _;
    }

    function test_WhenContractIsPaused() external whenCreateChannelIsCalled {
        // it should Revert

        changePrank(actor.admin);
        commProxy.pauseContract();
        vm.expectRevert("Pausable: paused");
        changePrank(actor.bob_channel_owner);
        commProxy.createIncentivizedChatRequest(_specificPayload, amount, 10_000_000);
    }

    function test_RevertWhen_AmountIsLessThanMinimumFees() external whenCreateChannelIsCalled {
        // it should revert
        amount = amount - amount;
        vm.expectRevert("Invalid Amount");
        changePrank(actor.bob_channel_owner);
        commProxy.createIncentivizedChatRequest(_specificPayload, amount, 10_000_000);
    }

    function test_RevertWhen_EtherPassedIsLess() external whenCreateChannelIsCalled {
        // it should revert
        vm.expectRevert(abi.encodeWithSelector(Errors.InsufficientFunds.selector));
        changePrank(actor.bob_channel_owner);
        commProxy.createIncentivizedChatRequest(_specificPayload, amount, 10_000_000);
    }

    function test_WhenAllChecksPasses() public whenCreateChannelIsCalled {
        // it should successfully create the CCR
        vm.expectEmit(true, false, false, false);
        emit LogMessagePublished(ArbSepolia.WORMHOLE_RELAYER_SOURCE, 2105, 0, requestPayload, 15);
        changePrank(actor.bob_channel_owner);
        commProxy.createIncentivizedChatRequest{ value: 1e18 }(_specificPayload, amount, 10_000_000);
    }

    modifier whenReceiveFunctionIsCalledInCore() {
        _;
    }

    function test_WhenSenderIsNotRegistered() external whenReceiveFunctionIsCalledInCore {
        // it should Revert
        test_WhenAllChecksPasses();

        setUpChain2(EthSepolia.rpc);
        //set sender to zero address
        coreProxy.setRegisteredSender(ArbSepolia.SourceChainId, toWormholeFormat(address(0)));

        vm.expectRevert("Not registered sender");
        changePrank(EthSepolia.WORMHOLE_RELAYER_DEST);
        coreProxy.receiveWormholeMessages(requestPayload, additionalVaas, sourceAddress, sourceChain, deliveryHash);
    }

    function test_WhenSenderIsNotRelayer() external whenReceiveFunctionIsCalledInCore {
        // it should Revert
        test_WhenAllChecksPasses();

        setUpChain2(EthSepolia.rpc);
        coreProxy.setWormholeRelayer(address(0));
        changePrank(EthSepolia.WORMHOLE_RELAYER_DEST);
        vm.expectRevert(abi.encodeWithSelector(Errors.CallerNotAdmin.selector));
        coreProxy.receiveWormholeMessages(requestPayload, additionalVaas, sourceAddress, sourceChain, deliveryHash);
    }

    function test_WhenDeliveryHashIsUsedAlready() external whenReceiveFunctionIsCalledInCore {
        // it should Revert
        test_WhenAllChecksPasses();

        setUpChain2(EthSepolia.rpc);
        changePrank(EthSepolia.WORMHOLE_RELAYER_DEST);
        coreProxy.receiveWormholeMessages(requestPayload, additionalVaas, sourceAddress, sourceChain, deliveryHash);
        vm.expectRevert(abi.encodeWithSelector(Errors.Payload_Duplicacy_Error.selector));
        coreProxy.receiveWormholeMessages(requestPayload, additionalVaas, sourceAddress, sourceChain, deliveryHash);
    }

    function test_WhenAllChecksPass() external whenReceiveFunctionIsCalledInCore {
        // it should emit event and create Channel

        setUpChain2(EthSepolia.rpc);

        uint256 poolFeeAmount = coreProxy.FEE_AMOUNT();
        uint256 userFundsPre = coreProxy.celebUserFunds(actor.charlie_channel_owner);
        uint256 PROTOCOL_POOL_FEES = coreProxy.PROTOCOL_POOL_FEES();

        changePrank(EthSepolia.WORMHOLE_RELAYER_DEST);

        vm.expectEmit(false, false, false, true);
        emit IncentivizeChatReqReceived(
            actor.bob_channel_owner, actor.charlie_channel_owner, amount - poolFeeAmount, poolFeeAmount, block.timestamp
        );

        coreProxy.receiveWormholeMessages(requestPayload, additionalVaas, sourceAddress, sourceChain, deliveryHash);

        assertEq(coreProxy.celebUserFunds(actor.charlie_channel_owner), userFundsPre + amount - poolFeeAmount);
        assertEq(coreProxy.PROTOCOL_POOL_FEES(), PROTOCOL_POOL_FEES + poolFeeAmount);
    }
}
