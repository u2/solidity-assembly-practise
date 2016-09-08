// https://github.com/androlo/solidity-workshop/blob/master/tutorials/2016-03-11-advanced-solidity-II.md#stack-machines

function run(bytecode) {
    var len = bytecode.length;
    if (!len || len % 2)
        throw new Error("Bad input");
    var hl = len >> 1;

    var code = new Array(hl);
    for (var i = 0; i < hl; i++) {
        code[i] = parseInt(bytecode.substr(i * 2, 2), 16);
    }

    console.log("code: ", code);

    var codeSize = code.length;
    var stack = [];
    var pc = -1;

    while (++pc < codeSize) {
        switch (code[pc]) {
            case 1:
                var a = (code[++pc] << 24);
                var b = (code[++pc] << 16);
                var c = (code[++pc] << 8);
                var d = code[++pc];
                console.log("a, b, c, d: ", a, b, c, d);
                var num = a | b | c | d;
                stack.push(num);
                console.log("PUSH: %d", num);
                break;
            case 2:
                if (stack.length < 2)
                    throw new Error("Stack underflow");
                var a = stack.pop(), b = stack.pop();
                var sum = a + b;
                stack.push(sum);
                console.log("ADD: %d + %d = %d", a, b, sum);
                break;
            default:
                throw new Error("Bad instruction");
        }
        console.log("Stack:", stack);
    }
    console.log("Done");
}

// PUSH    5           PUSH    10          ADD
// 0x01    0x00000005  0x01    0x0000000A  0x02

// Result:

// 0100000005010000000A02
run("0100000005010000000A02");


