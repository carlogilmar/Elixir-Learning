defmodule Pingpong do
	
	def loop({num_iterations, name}) do
		IO.puts ":: #{num_iterations} :: #{name}"
		receive do
			{:ball, from} -> pass_ball(from); loop({num_iterations + 1, name})
			{:stop} -> stop()
		end
	end

	def pass_ball(from) do
		:timer.slepp(2000)
		send(from, {:ball, from})
	end

	defp stop() do
		:ok
	end

end