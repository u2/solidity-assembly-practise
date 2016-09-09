contract Multiplier {
    function mul(uint a, uint b) constant returns (uint prod) {
        assembly {
                let i := 0
            loop:
                jumpi(end, eq(i, b))
                prod := add(prod, a)
                i := add(i, 1)
                jump(loop)
            end:
        }
    }

    function mul2(uint a, uint b) constant returns (uint prod) {
        assembly {
                // Stack will be preceded by 'prod', 'b' and then 'a'
                0   // Use this for index
            loop:
                dup1    // 'index'
                dup4    // 'b'
                eq
                end     // end tag
                jumpi   // conditional jump
                // if 'index' < 'b'
                dup4    // 'a'
                dup3    // 'prod'
                add
                swap2   // prod = add(prod, a)
                pop     // old value of 'prod'
                1
                add     // Add 1 to 'index'. Automatically replaces old 'i'.
                loop
                jump
            end:
                pop // pop index, no longer useful. product end up on top.
                0x0
                mstore
                32
                0x0
                return
        }
    }
}
