defmodule ControlFlow do

  defmacro unless(expression, do: block ) do
    quote do
      if !unquote(expression), do: unquote(block)
    end
  end

  #require ControlFlow
  #ControlFlow.function_sm 10, do: (fn (x) -> x+x end)
  #
  def function_sm( algo, do: block), do: block.(algo)

  ###############
  # number = 5
  # ast = quote do unquote(number) * 10 end
  # Code.eval_quoted ast
  ###############

  defmacro if_faker( expression, do: code_block ) do
    case expression do
      x when x in [false, nil] -> :fail
      _ -> code_block
    end
  end

end
