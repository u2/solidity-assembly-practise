contract Adder {
    function add(uint a, uint b) constant returns (uint sum) {
        assembly {
            sum := add(a, b)
        }
    }

    function add2(uint a, uint b) constant returns (uint) {
        assembly {
            mstore(0x0, add(a, b))
            return(0x0, 32)
        }
    }

    function add3(uint a, uint b) constant returns (uint sum) {
        assembly {
            b a add =: sum
        }
    }

    function add4(uint a, uint b) constant returns (uint) {
        assembly {
            a
            b
            add
            0x40
            mstore
            32
            0x40
            return
        }
    }

    function addTimesTwo(uint a, uint b) constant returns (uint sum) {
        assembly {
            add(a, b)
            dup1
            add
            =: sum
        }
    }

    
}
