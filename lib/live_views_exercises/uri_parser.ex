defmodule URI.Parser do
  @doc "Defines a default port"
  @callback default_port() :: integer

  @doc "Parses the given URL"
  @callback parse(uri_info :: URI.t()) :: URI.t()
end

defmodule URI.HTTP do
  @behaviour URI.Parser
  @impl true
  def default_port(), do: 80
  @impl true
  def parse(info), do: info
end
