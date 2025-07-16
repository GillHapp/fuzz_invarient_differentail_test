// scripts/double.js

const x = BigInt(process.argv[2]);

// Double the number
const result = x * 2n;

// ABI-encode the result as uint256 (32 bytes, hex)
const hex = result.toString(16).padStart(64, '0');
console.log("0x" + hex);
