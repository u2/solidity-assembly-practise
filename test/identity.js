fake_one = MyOneContract.at(Identity.address);

fake_one.setOne.sendTransaction(MyOne.address, 1, { from: web3.eth.accounts[0], gas: 300000 }, function(error, tx){
  if(!error)
    console.log('ok', tx);
})

miner.start(2);
admin.sleepBlocks(2);
miner.stop();

result = fake_one.getOne.call(MyOne.address, { from: web3.eth.accounts[0] });

console.log("result", result);

fake_list = MyListContract.at(Identity.address);
fake_list.setList.sendTransaction(MyList.address, 42, [0,1,2,4], { from: web3.eth.accounts[0], gas: 300000 }, function(error, tx){
  if(!error)
    console.log('ok', tx);
})

miner.start(2);
admin.sleepBlocks(2);
miner.stop();

result = fake_list.getAll.call(MyList.address, 42, { from: web3.eth.accounts[0] });

console.log("result", result);

result = MyAnswer.getAnswer.call(MyAnswer.address, { from: web3.eth.accounts[0] });

fake_answer = MyAnswerContract.at(Identity.address);
result = fake_answer.getAnswer.call(MyAnswer.address, { from: web3.eth.accounts[0] });
console.log("result", result);
