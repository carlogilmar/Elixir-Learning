defmodule Pingpong do

	# spawn(Example, :add, [2, 3]) 
	# recibe: Modulo, funcion (atomo), y parámetros de la función
	def start do
		ping = spawn(Pingpong, :loop, [{0, :ping}])
		pong = spawn(Pingpong, :loop, [{0, :pong}])
		send(ping, {:ball, pong})
	end
	
	def loop({num_iterations, name}) do
		IO.puts ":: #{num_iterations} :: #{name}"
		# Consumer
		receive do
			# Message     -> Do Something
			{:ball, from} -> pass_ball(from); loop({num_iterations + 1, name})
			{:stop} -> stop()
		end
	end

	def pass_ball(from) do
		:timer.sleep(2000)
		send(from, {:ball, self()})
	end

	defp stop() do
		:ok
	end

	def sayHello do
		IO.puts "::Say Hello:: Creating a process!"
		receive do
			{:ok, "hello"} -> IO.puts "Hola a todos!!"
		end
	end

	def example do
		IO.puts("1.- Init Consumer")
		consumerReady = spawn(Pingpong, :sayHello, [])
		IO.inspect consumerReady
		send consumerReady, {:ok, "hello"}
	end


	# My own example 
	def init do
		ping = spawn(Pingpong, :pingConsumer, [])	
		pong = spawn(Pingpong, :pongConsumer, [])	
		IO.puts "Sending messages!"
		send ping, {:ping, pong, ping}
	end

	def pingConsumer do
		receive do
			{:ping, process, me} -> IO.puts "ping!"; send process,{:pong, process, me} 
		end
	end

	def pongConsumer do
		receive do
			{:pong, me, process} -> IO.puts "pong!"; send process,{:ping, me, process}
		end
	end

end