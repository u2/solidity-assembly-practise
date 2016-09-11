contract MyTest {
  function f(address _add) constant returns(address a, uint b) {
    assembly {
      a := calldataload(4)
      b := calldatasize
    }
  }

  function f2(address _add, uint _i) constant returns(address a, uint b, uint c) {
    assembly {
      a := calldataload(4)
      b := calldatasize
      c := calldataload(36)
    }
  }

  function f22(string _s) constant returns (uint a, uint b) {
    assembly {
      // 100
      a := calldatasize
      // 4 + 32
      b := calldataload(36)
    }
  }

  function f3(address _add, string _s) constant returns(address a, uint b, uint c) {
    assembly {
      a := calldataload(4)
      // 132
      b := calldatasize
      // 4 + 32 + 32
      c := calldataload(68)
      // calldatacopy(mload(0x40), 0, sub(calldatasize, 68))
    }
  }

  function f4(address _add, uint[] _data) constant returns(address a, uint b, uint[] c) {
    assembly {
      a := calldataload(4)
      b := calldatasize
      let lenAddr := calldataload(8)
      // offset address by 4, read, assign to 'len'
      c := calldataload(add(lenAddr, 4))
    }
  }
}
