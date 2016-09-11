#!/bin/bash

geth=${GETH:-geth}

./bin/solc_helper.rb ./contracts/MyTest.sol MyTest_compiled.js
mv MyTest_compiled.js builds/
scripts="./builds/MyTest_compiled.js,./test/my_test.js"
$geth --datadir data --networkid 31415926 --rpc --rpccorsdomain "*" --nodiscover --unlock 3ae88fe370c39384fc16da2c9e768cf5d2495b48 --password <(echo -n 123456) --preload "$scripts" console 2>> ./logfile
