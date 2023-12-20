pragma solidity ^0.8.20;

import {BasePushCoreTest} from "../BasePushCoreTest.t.sol";
import {PushCoreStorageV1_5} from "contracts/PushCore/PushCoreStorageV1_5.sol";
import {Errors} from "contracts/libraries/Errors.sol";

contract UpdateChannelMeta_Test is BasePushCoreTest {
    function setUp() public virtual override {
        BasePushCoreTest.setUp();
    }

    modifier whenNotPaused() {
        _;
    }

    function test_Revertwhen_UpdatingInactiveChannel() public whenNotPaused {
        uint256 _amountBeingTransferred = ADD_CHANNEL_MIN_FEES;

        vm.prank(actor.bob_channel_owner);
        vm.expectRevert(
            abi.encodeWithSelector(
                Errors.UnauthorizedCaller.selector,
                actor.bob_channel_owner
            )
        );
        coreProxy.updateChannelMeta(
            actor.bob_channel_owner,
            _testChannelUpdatedIdentity,
            _amountBeingTransferred
        );
    }

    function test_Revertwhen_UpdatingDeactivatedChannel() public whenNotPaused {
        uint256 _amountBeingTransferred = ADD_CHANNEL_MIN_FEES;
        _createChannel(actor.bob_channel_owner);
        vm.prank(actor.bob_channel_owner);
        coreProxy.deactivateChannel();

        vm.prank(actor.bob_channel_owner);
        vm.expectRevert(
            abi.encodeWithSelector(
                Errors.UnauthorizedCaller.selector,
                actor.bob_channel_owner
            )
        );
        coreProxy.updateChannelMeta(
            actor.bob_channel_owner,
            _testChannelUpdatedIdentity,
            _amountBeingTransferred
        );
    }

    function test_Revertwhen_CallerNotChannelOwner() public whenNotPaused {
        uint256 _amountBeingTransferred = ADD_CHANNEL_MIN_FEES;
        _createChannel(actor.bob_channel_owner);

        vm.prank(actor.charlie_channel_owner);
        vm.expectRevert(
            abi.encodeWithSelector(
                Errors.UnauthorizedCaller.selector,
                actor.charlie_channel_owner
            )
        );
        coreProxy.updateChannelMeta(
            actor.bob_channel_owner,
            _testChannelUpdatedIdentity,
            _amountBeingTransferred
        );
    }

    function test_Revertwhen_UpdateZeroAddressChannel() public whenNotPaused {
        uint256 _amountBeingTransferred = ADD_CHANNEL_MIN_FEES;
        address _channelAddress = address(0x0);

        vm.prank(actor.bob_channel_owner);
        vm.expectRevert(
            abi.encodeWithSelector(
                Errors.UnauthorizedCaller.selector,
                actor.bob_channel_owner
            )
        );
        coreProxy.updateChannelMeta(
            _channelAddress,
            _testChannelUpdatedIdentity,
            _amountBeingTransferred
        );
    }

    function test_UpdateZeroAddressChannel() public whenNotPaused {
        uint256 _amountBeingTransferred = ADD_CHANNEL_MIN_FEES;
        address _channelAddress = address(0x0);

        vm.prank(actor.admin);
        coreProxy.updateChannelMeta(
            _channelAddress,
            _testChannelUpdatedIdentity,
            _amountBeingTransferred
        );
    }

    function test_Revertwhen_AmountLessThanRequiredFees() public whenNotPaused {
        uint256 _amountBeingTransferred = ADD_CHANNEL_MIN_FEES - 10 ether;
        _createChannel(actor.bob_channel_owner);

        vm.prank(actor.bob_channel_owner);
        vm.expectRevert(
            abi.encodeWithSelector(
                Errors.InvalidArg_LessThanExpected.selector,
                ADD_CHANNEL_MIN_FEES,
                _amountBeingTransferred
            )
        );
        coreProxy.updateChannelMeta(
            actor.bob_channel_owner,
            _testChannelUpdatedIdentity,
            _amountBeingTransferred
        );
    }

    function test_Revertwhen_AmountLessThanRequiredFeesForSecondUpdate()
        public
        whenNotPaused
    {
        uint256 _amountBeingTransferred = ADD_CHANNEL_MIN_FEES;
        _createChannel(actor.bob_channel_owner);

        vm.startPrank(actor.bob_channel_owner);
        coreProxy.updateChannelMeta(
            actor.bob_channel_owner,
            _testChannelUpdatedIdentity,
            _amountBeingTransferred
        );

        vm.expectRevert(
            abi.encodeWithSelector(
                Errors.InvalidArg_LessThanExpected.selector,
                ADD_CHANNEL_MIN_FEES * 2,
                _amountBeingTransferred
            )
        );
        coreProxy.updateChannelMeta(
            actor.bob_channel_owner,
            _testChannelUpdatedIdentity,
            _amountBeingTransferred
        );
        vm.stopPrank();
    }

    function test_UpdateWithSufficientFees() public whenNotPaused {
        uint256 _numberOfUpdates = 5;
        _createChannel(actor.bob_channel_owner);

        for (uint256 i; i < _numberOfUpdates; ++i) {
            uint256 _amountBeingTransferred = ADD_CHANNEL_MIN_FEES * (i + 1);

            approveTokens(
                actor.bob_channel_owner,
                address(coreProxy),
                _amountBeingTransferred
            );

            vm.prank(actor.bob_channel_owner);
            coreProxy.updateChannelMeta(
                actor.bob_channel_owner,
                _testChannelUpdatedIdentity,
                _amountBeingTransferred
            );
        }
    }

    function test_ContractShouldReceiveFeeTokens() public whenNotPaused {
        uint256 _numberOfUpdates = 5;
        _createChannel(actor.bob_channel_owner);

        for (uint256 i; i < _numberOfUpdates; ++i) {
            uint256 _amountBeingTransferred = ADD_CHANNEL_MIN_FEES * (i + 1);

            approveTokens(
                actor.bob_channel_owner,
                address(coreProxy),
                _amountBeingTransferred
            );

            uint256 _balanceOfPushTokensBeforeUpdateInProxy = pushToken
                .balanceOf(address(coreProxy));

            vm.prank(actor.bob_channel_owner);
            coreProxy.updateChannelMeta(
                actor.bob_channel_owner,
                _testChannelUpdatedIdentity,
                _amountBeingTransferred
            );

            uint256 _balanceOfPushTokensAfterUpdateInProxy = pushToken
                .balanceOf(address(coreProxy));
            assertEq(
                _balanceOfPushTokensAfterUpdateInProxy,
                _balanceOfPushTokensBeforeUpdateInProxy +
                    _amountBeingTransferred
            );
        }
    }

    function test_ShouldUpdateChannelVariables() public whenNotPaused {
        uint256 _numberOfUpdates = 5;
        _createChannel(actor.bob_channel_owner);

        for (uint256 i; i < _numberOfUpdates; ++i) {
            uint256 _amountBeingTransferred = ADD_CHANNEL_MIN_FEES * (i + 1);

            approveTokens(
                actor.bob_channel_owner,
                address(coreProxy),
                _amountBeingTransferred
            );

            vm.prank(actor.bob_channel_owner);
            coreProxy.updateChannelMeta(
                actor.bob_channel_owner,
                _testChannelUpdatedIdentity,
                _amountBeingTransferred
            );

            uint256 _channelUpdateCounterAfter = coreProxy.channelUpdateCounter(
                actor.bob_channel_owner
            );
            uint256 _channelUpdateBlock = _getChannelUpdateBlock(
                actor.bob_channel_owner
            );
            assertEq(_channelUpdateCounterAfter, i + 1);
            assertEq(_channelUpdateBlock, block.number);
        }
    }

    function test_ShouldUpdateFeeVariables() public whenNotPaused {
        _createChannel(actor.bob_channel_owner);

        uint256 _amountBeingTransferred = ADD_CHANNEL_MIN_FEES;
        uint256 poolFeesBeforeUpdate = coreProxy.PROTOCOL_POOL_FEES();
        uint256 channelPoolFundsBeforeUpdate = coreProxy.CHANNEL_POOL_FUNDS();

        vm.prank(actor.bob_channel_owner);
        coreProxy.updateChannelMeta(
            actor.bob_channel_owner,
            _testChannelUpdatedIdentity,
            _amountBeingTransferred
        );

        uint256 expectedProtocolPoolFees = poolFeesBeforeUpdate +
            _amountBeingTransferred;
        uint256 expectedChannelPoolFunds = channelPoolFundsBeforeUpdate;

        assertEq(coreProxy.PROTOCOL_POOL_FEES(), expectedProtocolPoolFees);
        assertEq(coreProxy.CHANNEL_POOL_FUNDS(), expectedChannelPoolFunds);
    }

    function test_EmitRelevantEventsU() public {
        _createChannel(actor.bob_channel_owner);
        uint256 _amountBeingTransferred = ADD_CHANNEL_MIN_FEES;

        vm.expectEmit(true, true, false, true, address(coreProxy));
        emit UpdateChannel(
            actor.bob_channel_owner,
            _testChannelUpdatedIdentity,
            _amountBeingTransferred
        );

        vm.prank(actor.bob_channel_owner);
        coreProxy.updateChannelMeta(
            actor.bob_channel_owner,
            _testChannelUpdatedIdentity,
            _amountBeingTransferred
        );
    }
}
