// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import {StdInvariant} from "forge-std/StdInvariant.sol";

import "../src/Checker.sol";

contract CheckerUnitTest is StdInvariant, Test {
    Checker checker;

    function setUp() public {
        checker = new Checker();
        targetContract(address(checker));
    }

    ////////////////////////// Unit Tests //////////////////////////

    function testInitialStateIsZero() public {
        assertEq(checker.invariant_should_not_alter(), 0);
    }

    function testSettingInput42SetsErrorState() public {
        checker.process(42);
        assertEq(checker.invariant_should_not_alter(), 1);
    }

    function testSettingLastInput99CausesErrorState() public {
        checker.process(10);
        checker.process(99);
        assertEq(checker.invariant_should_not_alter(), 0);
    }

    function testErrorStatePersistsAfterOtherInputs() public {
        checker.process(42);
        checker.process(5);
        assertEq(checker.invariant_should_not_alter(), 1);
    }

    ////////////////////////// Fuzz Tests //////////////////////////

    function testFuzz_Process(uint256 x) public {
        checker.process(x);
        assert(checker.invariant_should_not_alter() == 0);
    }

    ////////////////////////// Invariant Tests //////////////////////////
    function invariant_ShouldNotAlter() public view {
        assertEq(checker.invariant_should_not_alter(), 0);
    }
}
