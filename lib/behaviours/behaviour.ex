defmodule Worker do
  @callback init(state :: term) :: {:ok, new_state :: term}
end
