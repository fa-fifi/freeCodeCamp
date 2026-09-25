const assert = require("node:assert/strict");
const { isPrime } = require("./index");

assert(isPrime(3), true);
assert(!isPrime(4), true);
