result = MyTest.f.call('0xc66ea802717bfb9833400264dd12c2bceaa34a6d', { from: web3.eth.accounts[0] })
console.log('f result: ', result[0], result[1].toNumber());

result = MyTest.f2.call('0xc66ea802717bfb9833400264dd12c2bceaa34a6d', 3, { from: web3.eth.accounts[0] })
console.log('f2 result: ', result[0], result[1], result[2].toNumber());

result = MyTest.f2.call('0xc66ea802717bfb9833400264dd12c2bceaa34a6d', 128, { from: web3.eth.accounts[0] })
console.log('f2 result: ', result[0], result[1], result[2].toNumber());

result = MyTest.f22.call('xxxx', { from: web3.eth.accounts[0] })
console.log('f22 result: ', result[0].toNumber(), result[1].toNumber());

result = MyTest.f3.call('0xc66ea802717bfb9833400264dd12c2bceaa34a6d', 'xxxxx', { from: web3.eth.accounts[0] })
console.log('f3 result: ', result[0], result[1], result[2]);

result = MyTest.f4.call('0xc66ea802717bfb9833400264dd12c2bceaa34a6d', [1,2,4,5,6,1111111,88888888], { from: web3.eth.accounts[0] })
console.log('f4 result: ', result[0], result[1], result[2]);
