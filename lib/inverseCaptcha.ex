defmodule InverseCaptcha do

  def start(captcha) do
    String.codepoints(captcha)
      |> parserToInteger
  end

  def parserToInteger( [h|t] ) do
    {parsedInteger,_} = Integer.parse(h)
    [ parsedInteger ] ++ parserToInteger(t)
  end

  def parserToInteger( [] ), do: []

  def getSumList([e], sumList) do
    sumList
  end
  def getSumList( elementList, sumList) do
    [ element | t ] = elementList
    [ next | _ ] = t
    suscribeElement({ element == next, element, t, sumList })
  end

  def suscribeElement({true, element, list, sumList}) do
    getSumList( list, sumList ++ [element])
  end
  def suscribeElement({false, _, list, sumList}) do
    IO.puts("can u see me?")
    IO.inspect( list )
    getSumList( list, sumList)
  end
  def suscribeElement({_, _, [], sumList}) do
    IO.puts("Terminamos la lista ==============>")
    getSumList( [], sumList)
  end

end
