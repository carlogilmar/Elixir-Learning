defmodule BeerSong do

  def until(0), do: " Iniciamos "
  def until(number) do
    " #{number} cervezas. #{number-1} cerveza. Toma una, pasala." <> until(number-1)
  end

end
