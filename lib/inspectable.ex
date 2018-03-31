defprotocol Inspectable do
	@fallback_to_any true
	def dump(element)
end

defimpl Inspectable, for: BitString do
	def dump(string) do
		"STRING: #{string}"
	end
end

defimpl Inspectable, for: Integer do
	def dump(0), do: "Zero!!!!!!!!"
	def dump(integer) do
		"INTEGER: #{integer}"
	end
end

# We create a new data struct called Point
# iex> %Point{x: 1, y: 2, z: 3}
# iex> Inspectable.dump(point)
defimpl  Inspectable, for: Point do
	def dump(%Point{x: x, y: y, z: z}) do
		":: Point Struct ::#{x}, #{y}, #{z}"
	end
end

defimpl Inspectable, for: Any do
	def dump(_) do
		".:: Random Element! ::."
	end
end
# Inspectable.dump(0) 