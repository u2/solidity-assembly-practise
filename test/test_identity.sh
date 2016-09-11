#!/bin/bash

geth=${GETH:-geth}

./bin/solc_helper.rb ./contracts/Identity.sol Identity_compiled.js
mv Identity_compiled.js builds/

./bin/solc_helper.rb ./contracts/MyOne.sol MyOne_compiled.js
mv MyOne_compiled.js builds/

./bin/solc_helper.rb ./contracts/MyList.sol MyList_compiled.js
mv MyList_compiled.js builds/

./bin/solc_helper.rb ./contracts/MyAnswer.sol MyAnswer_compiled.js
mv MyAnswer_compiled.js builds/

scripts="./builds/Identity_compiled.js,./builds/MyOne_compiled.js,./builds/MyList_compiled.js,./builds/MyAnswer_compiled.js"

# scripts="./builds/Identity_compiled.js,./builds/MyAnswer_compiled.js"

$geth --datadir data --networkid 31415926 --rpc --rpccorsdomain "*" --nodiscover --unlock 3ae88fe370c39384fc16da2c9e768cf5d2495b48 --password <(echo -n 123456) --preload "$scripts" console 2>> ./logfile
