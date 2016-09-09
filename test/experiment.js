Experiment.addinfo.sendTransaction('123456', 'abc', 100, 10, 22, { from: web3.eth.accounts[0], gas:300000 }, function(err, tx){
  if(err){
    console.log('err!');
  } else {
    console.log('tx', tx);
  }
})
miner.start(2);
admin.sleepBlocks(2);
miner.stop();

result = Experiment.getinfo.call('123456', 10, { from: web3.eth.accounts[0] });
console.log('result: ', result[0], result[1].toNumber(), result[2].toNumber(), result[3].toNumber());

// tx 0xbd44cf54d38809d9dea6f8a561ba8e0c029885b7a782997015090f8b6825e976
// result:  abc 100 10 22
