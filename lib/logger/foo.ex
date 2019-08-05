defmodule Foo do
  use Tracker

  def start() do
    model = %{msg: "pruebas", status: "created"}
    {:start, model}
      |> process()
      |> process()
      |> process()
  end

  def process(model) do
    track(model)
    {:process, model}
  end
end
