binOp = (op) -> ([a, b, rest...], numbers) -> [[op(a, b), rest...], numbers]

OPS =
  add:  binOp (a, b) -> a + b
  sub:  binOp (a, b) -> a - b
  mult: binOp (a, b) -> a * b
  div:  binOp (a, b) -> a / b

  push: (stack, numbers, i) ->
    stack.unshift numbers[i]

    [stack, numbers]


module.exports.numberSolution =
  (goal, numbers, stack = [], ops = []) ->
    tryOp = (ops, [stack, numbers]) ->
      if stack.length is 1 and stack[0] is goal
        return ops



    for i in [0 .. numbers.length - 1]
      [stack, numbers] = tryOp ops, OPS.push stack, numbers, i

      if ret = numberSolution goal, numbers, stack, ops
        return ret


