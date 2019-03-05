defmodule AwesomeLibrary do
  defmacro __using__(_) do
    quote do
      def print(s), do: IO.puts(s)
    end
  end
end
