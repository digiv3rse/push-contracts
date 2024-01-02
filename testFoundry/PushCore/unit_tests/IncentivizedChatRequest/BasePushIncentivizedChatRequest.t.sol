pragma solidity ^0.8.20;

import "forge-std/Test.sol";

import {BasePushCoreTest} from "../BasePushCoreTest.t.sol";
import {PushCoreStorageV1_5} from "contracts/PushCore/PushCoreStorageV1_5.sol";

contract BasePushIncentivizedChatRequest is BasePushCoreTest {
    
    function setUp() public virtual override {
        BasePushCoreTest.setUp();

        vm.startPrank(actor.admin);
        commProxy.setEPNSCoreAddress(address(coreProxy));
        commProxy.setPushTokenAddress(address(pushToken));
        vm.stopPrank();
    }
}
