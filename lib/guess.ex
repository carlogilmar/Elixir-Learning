defmodule Guess do

  use Bitwise

  def myNumber, do: guess(100,0, :rand.uniform(100))

  def guess(upperLimit, lowerLimit, number) do
    purpose = (upperLimit + lowerLimit) >>> 1
    IO.puts "El numero está entre #{lowerLimit}-#{upperLimit}. Es #{purpose} el numero?"
    findingNumber( { purpose>number, purpose<number, purpose==number, purpose, upperLimit, lowerLimit, number } )
  end

  def findingNumber({true,_,_,purpose, _, lowerLimit, number}) do
    IO.puts "El numero a buscar es menor que #{purpose}"
    guess(purpose-1, lowerLimit, number)
  end

  def findingNumber({_,true,_,purpose, upperLimit, _, number}) do
    IO.puts "El numero a buscar es mayor que #{purpose}"
    guess(upperLimit, purpose+1, number)
  end

  def findingNumber({_,_,true,purpose,_,_,number}), do: { :isTheNumber, purpose, number }

end
