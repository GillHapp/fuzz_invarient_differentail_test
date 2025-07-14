// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Divider {
    function divide(uint256 a, uint256 b) public pure returns (uint256) {
        // ⚠️ Bug: no check for division by zero
        return a / b;
    }
}

pragma solidity ^0.8.13;

import "forge-std/Test.sol";

contract Safe {
    receive() external payable {}

    function withdraw() external {
        // Intentionally uses `transfer`, which can break for large balances
        payable(msg.sender).transfer(address(this).balance);
    }
}

pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";

contract CounterTest is Test {
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
