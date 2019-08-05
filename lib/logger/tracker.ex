defmodule Tracker do
  defmacro __using__(_) do
    quote do
      def track(_model) do
        IO.puts "logger!"
      end
    end
  end
end
