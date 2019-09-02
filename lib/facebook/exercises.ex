defmodule FbExercises do
  def generate_matrix(pivot) do
    pivot
      |> generate_model()
    ###|> fill_first_list()
      #|> fill_last_list()
      #|> fill_body()
  end

  def generate_model(pivot) do
    model = for _index <- Enum.to_list(1..pivot), do: []
    numbers_available = Enum.to_list(1..(pivot*pivot))
    {model, numbers_available, pivot}
  end

  def fill_first_list({model, numbers_available, pivot}) do
    [_first|tail] = model
    first_line = Enum.take(numbers_available, pivot)
    numbers_available = numbers_available -- first_line
    {[first_line|tail], numbers_available, pivot}
  end

  def fill_last_list({model, numbers_available, pivot}) do
    rows = pivot - 2 # -- first and last list
    numbers_for_other_lists = Enum.take(numbers_available, rows) # numbers for body lists
    numbers_available = numbers_available -- numbers_for_other_lists
    last_list =
      numbers_available
        |> Enum.take(pivot)
        |> Enum.reverse()
    [_last|tail] = Enum.reverse(model)
    model = Enum.reverse([last_list|tail])
    numbers_available = numbers_for_other_lists ++ numbers_available -- last_list
    {model, numbers_available, pivot}
  end

end
