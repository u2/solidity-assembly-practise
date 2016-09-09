result = C.f.call(200, false, { from: web3.eth.accounts[0] })
console.log('f result: ', result);
miner.start(2);
miner.stop();

result = C.f.call(40, true, { from: web3.eth.accounts[0] })
console.log('f1 result: ', result);
miner.start(2);
miner.stop();

result = C.f2.call({ from: web3.eth.accounts[0] })
console.log('f2 result: ', result);
miner.start(2);
miner.stop();

result = C.f3.call(10, 20, { from: web3.eth.accounts[0] })
console.log('f3 result: ', result[0].toNumber(), result[1].toNumber(), result[2].toNumber());
miner.start(2);
miner.stop();

result = C.f4.call(10, 20, { from: web3.eth.accounts[0] })
console.log('f4 result: ', result[0].toNumber(), result[1].toNumber());
miner.start(2);
miner.stop();

result = C.f5.call({ from: web3.eth.accounts[0] })
console.log('f5 result: ', result.toNumber());
miner.start(2);
miner.stop();

result = C.f6.call({ from: web3.eth.accounts[0] })
console.log('f6 result: ', result.toNumber());
miner.start(2);
miner.stop();

result = C.f7.call([1,3,5,7],{ from: web3.eth.accounts[0] })
console.log('f7 result: ', result.toNumber());
miner.start(2);
miner.stop();

result = C.f8.call([1,3,5,7],{ from: web3.eth.accounts[0] })
console.log('f8 result: ', result.toNumber());
miner.start(2);
miner.stop();

result = C.f9.call(7,{ from: web3.eth.accounts[0] })
console.log('f9 result: ', result[0], result[1]);
miner.start(2);
miner.stop();

result = C.f10.call([11],{ from: web3.eth.accounts[0] })
console.log('f10 result: ', result.toNumber());
miner.start(2);
miner.stop();

