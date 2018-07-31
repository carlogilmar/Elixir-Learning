defmodule Learning do

  def fizzbuzz(number) do
    number
      |> makeListUntil
      |> applyFizzbuzz([])
  end

  def makeListUntil(1), do: [1]
  def makeListUntil(n), do: makeListUntil(n-1) ++ [ n ]

  def applyFizzbuzz([], fb_list), do: fb_list
  def applyFizzbuzz([head|tail], fb_list) do
    item = fb_categorize({ rem(head,3)==0, rem(head,5)==0, {head} })
    applyFizzbuzz( tail, fb_list ++ [item] )
  end

  def fb_categorize({true, false, _}), do: :fizz
  def fb_categorize({false, true, _}), do: :buzz
  def fb_categorize({true, true, _}), do: :fizzbuzz
  def fb_categorize({_, _, number}), do: number

	# previous version
	def eval(0), do: [0]
	def eval(elem) when rem(elem,5)==0 and rem(elem,3)==0, do: eval(elem-1) ++[:fizzbuzz]
	def eval(elem) when rem(elem,3)==0, do: eval(elem-1) ++ [:fizz]
	def eval(elem) when rem(elem,5)==0, do: eval(elem-1) ++ [:buzz]
	def eval(elem), do: eval(elem-1) ++ [elem]

end
