defmodule Higher do

  def execute do
    fn (fun, x) ->
      fun.(x)
    end
  end

end
