#!/usr/bin/expect -f

set key [lindex $argv 0];
set geth [lindex $argv 1];

spawn $geth --datadir data account import $key
expect "Passphrase:"
expect "Repeat Passphrase:"
interact
