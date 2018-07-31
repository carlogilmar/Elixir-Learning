defmodule InverseCaptcha do

  def start(captcha) do
    String.codepoints(captcha)
    |> parserToInteger
    |> createSumList
    |> sumList(0)
  end

  # parserToInteger(["1","2","3","4"]) = [1,2,3,4]
  def parserToInteger( [] ), do: []
  def parserToInteger( [h|t] ) do
    {parsedInteger,_} = Integer.parse(h)
    [ parsedInteger ] ++ parserToInteger(t)
  end

  def createSumList(numberList) do
    [h|_]=numberList
    getSumList(numberList, [], h)
  end

  def getSumList([], sumList, _), do: sumList
  def getSumList([last], sumList, first), do: suscribeElement({last==first, last, [], sumList, first})
  def getSumList( elementList, sumList, first) do
    [ element | t ] = elementList
    [ next | _ ] = t
    suscribeElement({ element == next, element, t, sumList, first })
  end

  def suscribeElement({true, element, list, sumList, first}), do: getSumList( list, sumList ++ [element], first)
  def suscribeElement({false, _, list, sumList, first}), do: getSumList( list, sumList, first)
  def suscribeElement({_, _, [], sumList, first}), do: getSumList( [], sumList, first)

  # Get a sum of all elements from a list with integers.
  # InverseCaptcha.sumList([1,2,3],0) = 6
  def sumList([], sum), do: sum
  def sumList(elements, sum) do
    [h|t] = elements
    sumList( t, sum+h )
  end

end
