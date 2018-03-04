defmodule Nucleotide do

  # AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC
  # 20 12 17 21
  # A', 'C', 'G', and 'T'

  def process([], _), do: [{:a,0}, {:c,0}, {:g,0}, {:t,0}]
  def process([h|t], counters) do

  end


  def start() do
    get(["A","B","B","A","A","B"], %{"A"=>0,"B"=>0})
  end

  def get([h|t], c) do
    increment(h, t, c)
  end

  def get([], counters), do: IO.inspect counters

  def increment(element, tail, counters) do
    currentCounter = counters[element] + 1
    countersUpdated = Map.put(counters, element, currentCounter)
    IO.inspect countersUpdated
    get( tail, countersUpdated)
  end

  def increment(_, [], counters), do: :end_of_list


end


