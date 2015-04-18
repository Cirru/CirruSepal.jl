using CirruSepal
using Base.Test

f = open("../examples/demo.cirru", "r")

ast = CirruSepal.compile(readall(f))

dump(ast)

eval(ast)
