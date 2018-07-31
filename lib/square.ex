defmodule Square do

  def find( [], square), do: square

  def find( [h|t], squares) do
    find(t, squares++[h*h])
  end

end
