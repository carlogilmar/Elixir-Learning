defmodule Swoosh.Adapter do
  @type t :: module

  @type email :: Swoosh.Email.t

  @typep config :: Keyword.t

  @callback deliver(email, config) :: {:ok, term} | {:error, term}
end
