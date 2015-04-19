
module CirruSepal

  using CirruParser
  export compile, evaluateFile

  function transformProgram(ast)
    exprs = map(transform, ast)
    return Expr(:toplevel, exprs...)
  end

  function transform(x)
    if typeof(x) <: String
      if ismatch(r"^\d+$", x)
        return int(x)
      elseif x == "true"
        return true
      elseif x == "false"
        return false
      elseif ismatch(r"^:", x)
        return string(x[2:end])
      else
        return symbol(x)
      end
    elseif typeof(x) <: Array
      head = x[1]
      exprs = map(transform, x[2:end])
      return Expr(symbol(head), exprs...)
    else
      return :error
    end
  end

  function compile(code)
    tree = CirruParser.pare(code, "")
    transformProgram(tree)
  end

  function evaluateFile(relativeName)
    code = readall(open(relativeName))
    ast = compile(code)
    eval(ast)
  end

end # module
