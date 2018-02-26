defmodule Fibonacci do

  def findItem(0), do: 0
  def findItem(1), do: 1
  def findItem(number) do
    ( findItem(number-2) + findItem(number-1) )
  end

end
