defmodule FbExercises do

  def generate_starter_model(pivot) do
    pivot
      |> generate_model()
      |> fill_first_list()
      |> fill_last_list()
      |> put_last_vertx()
      |> put_first_row()
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

  def put_last_vertx({model, numbers_available, pivot}) do
    [first_list|tail] = model
    [last_line|tail] = Enum.reverse(tail)
    body_lists =
      for {list, number} <- Enum.zip(tail, numbers_available) do
        [list ++ number]
      end
    model = [first_list] ++ body_lists ++ [last_line]
    numbers_used = Enum.take(numbers_available, length(body_lists))
    numbers_available = numbers_available -- numbers_used
    {model, numbers_available, pivot}
  end

  def put_first_row({model, numbers_available, pivot}) do
    [first_list|tail] = model
    [last_line|tail] = Enum.reverse(tail)
    body_lists =
      for {list, number} <- Enum.zip(tail, numbers_available) do
        [number] ++ list
      end
    body_lists = Enum.reverse(body_lists)
    numbers_used = Enum.take(numbers_available, length(body_lists))
    numbers_available = numbers_available -- numbers_used
    model = [first_list] ++ body_lists ++ [last_line]
    {model, numbers_available, pivot}
  end

end
