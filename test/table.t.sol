// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import {Test} from "forge-std/Test.sol";

contract tableTest is Test {
    struct TestCase {
        uint256 a;
        uint256 b;
        uint256 expected;
    }

    function fixtureSums() public pure returns (TestCase[] memory) {
        TestCase[] memory entries = new TestCase[](2);
        entries[0] = TestCase(1, 2, 3);
        entries[1] = TestCase(4, 5, 9);
        return entries;
    }

    function tableSumsTest(TestCase memory sums) public pure {
        require(sums.a + sums.b == sums.expected, "wrong sum");
    }
}
