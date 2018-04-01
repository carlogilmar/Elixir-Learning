defmodule Deck.Application do
	
	use Application

	def start(_type, _args) do
		Deck.start_link()
	end

end