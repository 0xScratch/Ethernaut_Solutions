/*
    So this is the main contract which is 'Lib.sol', there be one more contract 'HackMe.sol' which will come under your question part, and you can't make changes to them...

    Here is your task - 
        Claim the ownership of 'HackMe.sol'
    
    Note - Make sure that while calling a 'delegatecall' on some other contract, your state variables stucture should match with that particular contract including the way they are declared!!
*/

// SPDX-License-Identifier: Unlicensed

pragma solidity ^0.8.19;

contract Lib{
    uint public someNumber;

    function doSomething(uint _num) public{
        someNumber = _num;
    }
}