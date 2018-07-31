defmodule Nucleotide do

  # AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC
  # 20 12 17 21
  # A', 'C', 'G', and 'T'

  def start( nucleotide ) do
    String.codepoints(nucleotide)
      |> get( %{"A"=>0, "C"=>0, "G"=>0, "T"=>0} )
  end

  def get([h|t], counters), do: increment(h, t, counters)
  def get([], counters), do: IO.inspect counters

  def increment(element, tail, counters) do
    currentCounter = counters[element] + 1
    countersUpdated = Map.put(counters, element, currentCounter)
    get( tail, countersUpdated)
  end

end


