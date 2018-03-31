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


defimpl Inspectable, for: Any do
	def dump(_) do
		".:: Random Element! ::."
	end
end
# Inspectable.dump(0) 