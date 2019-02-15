defmodule Example do

  def mailbox() do
    receive do
      {:ping} ->
        IO.puts " Ping !!"
      {:pong} ->
        IO.puts " Pong !!"
    end
  end

end
