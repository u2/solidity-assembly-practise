#!/bin/bash

./bin/solc_helper.rb Adder.sol
./bin/solc_helper.rb C.sol

mv Adder_compiled.js builds/
mv C_compiled.js builds/