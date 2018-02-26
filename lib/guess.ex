defmodule Guess do

  use Bitwise

  def guess(purpose, number) do
    findingNumber( { purpose>number, purpose<number, purpose==number, purpose, number } )
  end

  def findingNumber({true,_,_,purpose, number}) do
    IO.puts " Es menor al propuesto... proponiendo"
    {:isSmaller, purpose, number} |> purposeNumber
  end

  def findingNumber({_,true,_,purpose, number}) do
    IO.puts "Es mayor al propuesto... proponiendo"
    {:isBigger, purpose, number} |> purposeNumber
  end

  def findingNumber({_,_,true,purpose,number}), do: { :isTheNumber, purpose, number }

  def purposeNumber({:isSmaller, purpose, number}) do
    IO.puts "#{purpose} no es. Intentando con: #{purpose-1} "
    guess( purpose-1, number)
  end
  def purposeNumber({:isBigger, purpose, number}) do
    IO.puts "#{purpose} no es. Intentando con: #{purpose+1} "
    guess( purpose+1 , number)
  end

end
