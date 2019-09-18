defmodule Badge do

  defstruct type: nil, level: 0, eligible?: false

  @doc "Returns a badge with its eligibility status."
  @callback eligible?(%{}) :: %Badge{}
  @doc "Checks the current badge level for the user"
  @callback find_level(%{}) :: integer

  @spec grant(%Badge{}, struct) :: struct | false
  def grant(%Badge{eligible?: false}, _), do: false
  def grant(badge, user) do
    %{}
  end
end

defmodule Badge.Firestarter do
  @moduledoc "Awarded when you invite a team member."
  @behaviour Badge

  def eligible?(user) do
    level = find_level(user)
    %Badge{type: "firestarter", level: level, eligible?: false}
  end
  def find_level(user) do
    0
  end
end
