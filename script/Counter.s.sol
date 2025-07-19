// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {Counter} from "../src/Counter.sol";

contract CounterScript is Script {
    Counter public counter;

    function setUp() public {}

    function run() public {
        vm.createSelectFork("sepolia");
        vm.startBroadcast();
        new Counter();
        vm.stopBroadcast();

        vm.createSelectFork("Avalanche_fuji");
        vm.startBroadcast();
        new Counter();
        vm.stopBroadcast();
    }
}
