pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;
import {BaseFuzzStaking} from "../BaseFuzzStaking.f.sol";

contract DaoHarvest_test is BaseFuzzStaking {
    function setUp() public virtual override {
        BaseFuzzStaking.setUp();
    }
    //   allows admin to harvest,
    function test_AdminHarvest(uint _fee, uint _passEpoch) public {
        _fee = bound(_fee, 100, pushToken.balanceOf(actor.admin) / 3e18);

        _passEpoch = bound(_passEpoch, 3, 22);

        addPool(_fee);

        roll(epochDuration * _passEpoch);

        daoHarvest(actor.admin, _passEpoch - 1);
        uint rewards = feePoolStaking.usersRewardsClaimed(address(coreProxy));

        assertEq(rewards, _fee * 1e18);
    }

    //  yields `0` if no pool funds added,  //  allows only admin to harvest
    function test_AdminHarvestZeroReward(uint _passEpoch) public {
        _passEpoch = bound(_passEpoch, 3, 22);

        roll(epochDuration * _passEpoch);
        vm.expectRevert();
        daoHarvest(actor.bob_channel_owner, _passEpoch - 1);
        daoHarvest(actor.admin, _passEpoch - 1);
        uint rewardsBef = feePoolStaking.usersRewardsClaimed(
            address(coreProxy)
        );

        assertEq(rewardsBef, 0);
    }

    //  admin rewards and user rewards match the pool fees,
    function test_TotalClaimedRewards(
        uint _amount,
        uint _fee,
        uint _passEpoch
    ) public {
        _fee = bound(_fee, 100, pushToken.balanceOf(actor.admin) / 3e18);
        _amount = bound(
            _amount,
            1,
            pushToken.balanceOf(actor.bob_channel_owner) / 1e18
        );

        _passEpoch = bound(_passEpoch, 2, 22);

        addPool(_fee);
        stake(actor.bob_channel_owner, _amount);
        roll(epochDuration * _passEpoch);
        harvest(actor.bob_channel_owner);
        daoHarvest(actor.admin, _passEpoch - 1);
        uint rewardsAd = feePoolStaking.usersRewardsClaimed(address(coreProxy));
        uint rewardsBob = feePoolStaking.usersRewardsClaimed(
            actor.bob_channel_owner
        );
        uint claimed = rewardsAd + rewardsBob;
        assertApproxEqAbs(_fee * 1e18, claimed, 1 ether);
    }

    //  dao gets all rewards if no one stakes,
    function test_NoStakerDaoGetsRewards(uint _passEpoch, uint _fee) public {
        _passEpoch = bound(_passEpoch, 3, 22);
        _fee = bound(_fee, 100, pushToken.balanceOf(actor.admin) / 3e18);

        addPool(_fee);
        roll(epochDuration * _passEpoch);
        daoHarvest(actor.admin, _passEpoch - 1);

        uint claimed = feePoolStaking.usersRewardsClaimed(address(coreProxy));
        assertEq(claimed, _fee * 1e18);
    }
}
