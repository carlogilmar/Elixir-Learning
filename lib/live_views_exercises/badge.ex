defmodule Badge do

  defstruct type: nil, level: 0, eligible?: false

  @doc "Returns a badge with its eligibility status."
  @callback eligible?(%User{}) :: %Badge{}
  @doc "Checks the current badge level for the user"
  @callback find_level(%User{}) :: integer

  @spec grant(%Badge{}, struct) :: struct | false
  def grant(%Badge{eligible?: false}, _), do: false
  def grant(badge, user) do
    params = %{"badges" => Map.new([{badge.type, badge.level}])}
    Account.update_user(user, params) # save to database
  end
end
