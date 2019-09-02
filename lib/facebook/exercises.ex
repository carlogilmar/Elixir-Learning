defmodule FbExercises do
  def generate_matrix(number) do
    limit = get_numbers_for_fill_matrix.(number)
    numbers = Enum.to_list(1..limit)
    fill_matrix(numbers, number)
  end

  def fill_matrix(numbers, number) do
    empty_lists = for _n <- Enum.to_list(1..number), do: []
    first_list = Enum.take(numbers, number)
    numbers_available = numbers -- first_list
    list_with_end = fill_last_element_in_lists(empty_lists, numbers_available)
    last_list = fill_last_list(list_with_end, number)
    [first_list, [8,9,4], last_list]
  end

  def fill_last_list({lists, numbers}, number) do
    [last_list|_t] = Enum.reverse(lists)
    indexes = Enum.to_list(1..(number-1))
    tail_last_list = for {_index, number} <- Enum.zip(indexes, numbers), do: number
    Enum.reverse(tail_last_list) ++ last_list
  end

  def fill_last_element_in_lists(matrix, numbers) do
    size = length(matrix)
    numbers_not_used = numbers -- (Enum.take(numbers, size-1))
    [_list|tail] = matrix
    next_lists =
      for {list, number} <- Enum.zip(tail, numbers) do
        list ++ [number]
      end
    {next_lists, numbers_not_used}
  end

  def get_numbers_for_fill_matrix do
    fn number ->
      number * number
    end
  end

end
