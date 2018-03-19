defmodule InverseCaptcha do

  def start(captcha) do
    String.codepoints(captcha)
    |> parserToInteger
    |> createSumList
    |> sumList(0)
  end

  def parserToInteger( [h|t] ) do
    {parsedInteger,_} = Integer.parse(h)
    [ parsedInteger ] ++ parserToInteger(t)
  end

  def parserToInteger( [] ), do: []

  def createSumList(numberList) do
    [h|_]=numberList
    getSumList(numberList, [], h)
  end

  def getSumList([], sumList, _) do
    sumList
  end

  def getSumList([last], sumList, first) do
    suscribeElement({last==first, last, [], sumList, first})
  end

  def getSumList( elementList, sumList, first) do
    [ element | t ] = elementList
    [ next | _ ] = t
    suscribeElement({ element == next, element, t, sumList, first })
  end

  def suscribeElement({true, element, list, sumList, first}) do
    getSumList( list, sumList ++ [element], first)
  end

  def suscribeElement({false, _, list, sumList, first}) do
    getSumList( list, sumList, first)
  end

  def suscribeElement({_, _, [], sumList, first}) do
    getSumList( [], sumList, first)
  end

  def sumList([], sum), do: sum
  def sumList(elements, sum) do
    [h|t] = elements
    sumList( t, sum+h )
  end


end
