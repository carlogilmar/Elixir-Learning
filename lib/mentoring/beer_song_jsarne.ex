defmodule Exercism.BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    """
    #{bottle_text(number)} of beer on the wall, #{String.downcase(bottle_text(number))} of beer.
    #{line_two(number)}
    """
  end

  defp bottle_text(0), do: "No more bottles"
  defp bottle_text(1), do: "1 bottle"
  defp bottle_text(number), do: "#{number} bottles"

  defp line_two(0), do: "Go to the store and buy some more, #{bottle_text(99)} of beer on the wall."
  defp line_two(number), do: "Take #{if number==1, do: "it", else: "one"} down and pass it around, #{String.downcase(bottle_text(number-1))} of beer on the wall."

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(), do: lyrics(99..0)
  def lyrics(range) do
    String.trim_leading(Enum.reduce(range, "", fn v, acc -> acc <> "\n" <> verse(v) end))
  end
end
