// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Checker - Test contract for invariant-based fuzzing
contract Checker {
    uint256 public invariant_should_not_alter = 0;
    uint256 private lastInput = 0;

    function process(uint256 input) public {
        // if (input == 42) {
        //     invariant_should_not_alter = 1;
        // }
        // if (lastInput == 99) {
        //     invariant_should_not_alter = 1;
        // }
        lastInput = input;
    }
}
