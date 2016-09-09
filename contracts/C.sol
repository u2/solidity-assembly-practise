contract C {
    function f(uint n, bool b) constant returns (address addr) {
        uint x = 55;

        assembly {
                let sum := add(n, x)
                // Jump if 'n + x' is less then 100, or 'b' is true
                jumpi(skip_tag, or(b, lt(sum, 100)))
                // Otherwise, set 'addr' to the caller address.
                addr := caller
            skip_tag:
        }
    }

    function f2() constant returns (uint ret) {
        // 'ret' will remain until function has returned.
        assembly {
            let x := 0 // Creates a stack item, keeps track of its index.
            let y := 5 // Same
            {
                let z := 17     // Creates another stack item.
                let y := 8      // local y overrides.
                x := add(y, z)  // 8 + 17
            }
            // z and nested y gone. Stack items popped.
            // y := z not possible
            ret := mul(x, y) // 25*5
        }
        // x and y both gone, stack items popped.
        return;
    }

    function f3(uint a) constant returns (uint[]) {
        uint[] memory arr = new uint[](3);
        arr[0] = a;
        arr[1] = 0x24;
        assembly {
            let len := mload(arr) // Length at first address.
            let arr0 := mload(add(arr, 32)) // Read first element.
            let arr1 := mload(add(arr, 64)) // Read second element.
            mstore(add(arr, 96), 7) // Write to element 3
        }
        return arr;
    }

    function f4(uint a, uint b) constant returns (uint[]) {
        assembly {
            // Create an dynamic sized array manually.
            let memOffset := mload(0x40) // 0x40 is the address where next free memory slot is stored in Solidity.
            mstore(memOffset, 0x20) // single dimensional array, data offset is 0x20
            mstore(add(memOffset, 0x20), 2) // Set size to 2
            mstore(add(memOffset, 0x40), a) // array[0] = a
            mstore(add(memOffset, 0x60), b) // array[1] = b
            return(memOffset, 0x80)
        }
    }

    uint _a = 55; // Stored at storage-address 0x0

    function f5() constant returns (uint a) {
        assembly {
            _a  // Adds 'address to _a', which is 0x0, then 'offset of _a', which is 0.
            pop // Remove offset.
            sload =: a
        }
    }

    function f6() constant returns (uint a) {
        assembly {
            a := sload(0x0)
        }
    }

    function f7(uint[] arr) constant external returns (uint len) {
        assembly {
            // address to length, offset by 4
            let lenAddr := calldataload(4)
            // offset address by 4, read, assign to 'len'
            len := calldataload(add(lenAddr, 4))
        }
    }

    function f8(uint[] arr) constant external returns (uint offset) {
        assembly {
            // address to length, offset by 4
            let lenAddr := calldataload(4)
            // offset address by 4, read, assign to 'offset'
            offset := calldataload(lenAddr)
        }
    }

    function f9(uint a) constant returns (bool stackSame, bool txDataSame) {
        // We can work with 'a' in three ways - the variable, the stack
        // item, or read from calldata.
        assembly {
            let aFromStack := 0
            // Stack: [..., a, stackSame, txDataSame, aFromStack]
            dup4 =: aFromStack // set aFromStack to 'a'
            let aFromTxData := calldataload(4)
            stackSame := eq(aFromStack, a)
            txDataSame := eq(aFromTxData, a)
        }
    }

    function f10(uint[] arr) constant returns (uint) {
        return _g();
    }

    function _g() constant internal returns (uint x) {
        assembly {
            x := calldataload(4) // Will read the '0x20' from array call-data every time, even though `_g` has no params.
        }
    }

}
