
CirruSepal
----

Transforms Cirru code into Julia AST.

### Goal

This is an exprimental project trying to run Cirru on top of LLVM IR.

Plan:

* create command line to run `.cirru` files.
* more demos of Julia AST in Cirru
* try adding `include` for loading files

### Usage

```julia
ast = CirruSepal.compile(readall(f))

dump(ast)

eval(ast)
```

```cirru
= a :demo
call println a
call println (tuple 1)
call println (cell1d 1)
call println (call symbol a)

call println true false
```

### License

MIT
