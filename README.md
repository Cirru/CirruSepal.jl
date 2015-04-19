
CirruSepal
----

Transforms Cirru code into Julia AST.

### Goal

This is an exprimental project trying to run Cirru on top of LLVM IR.

Plan:

* more demos of Julia AST in Cirru
* try adding `include` for loading files

### Usage

```julia
Pkg.clone("https://github.com/Cirru/CirruSepal.jl")
```

```julia
using CirruSepal

code = "call println (tuple 1)"

ast = CirruSepal.compile(code)
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

### Command line

By create a soft link to `/usr/local/bin/sepal` to `bin/sepal` in this repo,
you get a simple command line tool to read and run files

For exmaple on my machine:

```bash
ln -s /Users/chen/.julia/CirruSepal/bin/sepal /usr/local/bin/sepal
```

then I can run this command to evaluate a file:

```bash
sepal demo.cirru
```

### License

MIT
