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
}
