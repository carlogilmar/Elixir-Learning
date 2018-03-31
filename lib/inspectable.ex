defprotocol Inspectable do
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