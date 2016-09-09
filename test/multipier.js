result = Multiplier.mul.call(10, 20, { from: web3.eth.accounts[0] })
console.log('mul result: ', result.toNumber());
miner.start(2);
miner.stop();

result = Multiplier.mul2.call(10, 20, { from: web3.eth.accounts[0] })
console.log('mul result: ', result.toNumber());
miner.start(2);
miner.stop();
