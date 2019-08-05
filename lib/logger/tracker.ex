defmodule Tracker do
	alias App.Builder
	defmacro __using__([]) do
		quote do
			def track(model, status) do
				IO.inspect model
				Builder.build(model)
				IO.puts "!!tracking... change status to #{status}"
			end
		end
	end
end
