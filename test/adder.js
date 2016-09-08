result = Adder.add.call(1,3, { from: web3.eth.accounts[0] })
console.log('add1 result: ', result);
miner.start(2);
miner.stop();

result = Adder.add2.call(1,3, { from: web3.eth.accounts[0] })
console.log('add2 result: ', result);
miner.start(2);
miner.stop();

result = Adder.add3.call(1,3, { from: web3.eth.accounts[0] })
console.log('add3 result: ', result);
miner.start(2);
miner.stop();

result = Adder.add4.call(1,3, { from: web3.eth.accounts[0] })
console.log('add4 result: ', result);
miner.start(2);
miner.stop();

result = Adder.addTimesTwo.call(1,3, { from: web3.eth.accounts[0] })
console.log('addTimesTwo result: ', result);
miner.start(2);
miner.stop();

