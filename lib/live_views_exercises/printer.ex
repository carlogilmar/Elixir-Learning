defmodule Printer do
  @doc """
		Behaviours
      iex(1)> Printer.behaviour_info(:callbacks)
      [print: 1]
  """
  @callback print(text :: String.t()) :: :me_vale_lo_que_regresas | {:error, String.t()}
end

defmodule MyOwnPrinter do
  @behaviour Printer

  @impl Printer
  def print(text) when is_binary(text) do
    IO.puts(text)
  end
end
