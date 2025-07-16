// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "forge-std/Test.sol";

contract FfiDiffTest is Test {
    function double(uint256 x) public pure returns (uint256) {
        return x * 2;
    }

    function testDoubleMatchesJS(uint256 x) public {
        // Limit x to prevent overflow in JS
        vm.assume(x < 1e18);

        string memory inputStr = vm.toString(x);

        string[] memory cmd = new string[](3);
        cmd[0] = "node"; // Node.js executable
        cmd[1] = "scripts/double.js"; // Script path
        cmd[2] = inputStr; // Pass `x` as CLI arg

        // Run JS script
        bytes memory result = vm.ffi(cmd);

        // Decode result as uint256
        uint256 jsResult = abi.decode(result, (uint256));
        uint256 solidityResult = double(x);

        // Assert they are equal
        assertEq(solidityResult, jsResult);
    }
}
