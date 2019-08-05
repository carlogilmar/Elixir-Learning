defmodule Tracker do
	defmacro __using__([]) do
		quote do
			def track(model) do
				IO.inspect model
				Builder.build(model)
				IO.puts "tracking..."
			end
		end
	end
end
