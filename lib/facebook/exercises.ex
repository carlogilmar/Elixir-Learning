defmodule FbExercises do
  def generate_matrix(pivot) do
    limit = get_numbers_for_fill_matrix.(pivot)
    numbers_for_fill = Enum.to_list(1..limit)
    fill_matrix(numbers_for_fill, pivot)
  end

  def fill_matrix(numbers_for_fill, pivot) do

    empty_lists = for _n <- Enum.to_list(1..pivot), do: []

    {first_list, numbers_available} = get_first_list(numbers_for_fill, pivot)

    {tail, numbers_available} = fill_last_element_in_lists(empty_lists, numbers_available)

    [_last|lists_with_last_element] = Enum.reverse(tail)

    {last_list, numbers_available} = fill_last_list({tail, numbers_available}, pivot)

    fill_empty_lists(lists_with_last_element, numbers_available)
  end

  def fill_empty_lists(lists_with_last_element, numbers_available) do
    {lists, numbers_available} =
      put_first_element_in_list(lists_with_last_element, numbers_available)
  end

  def put_first_element_in_list(lists_with_last_element, numbers_available) do
    lists_with_first_and_last =
      for {list, num} <- Enum.zip(lists_with_last_element, numbers_available) do
        [num] ++ list
      end
    numbers_used = Enum.take(numbers_available, length(lists_with_last_element))
    numbers_available = numbers_available -- numbers_used
    {lists_with_first_and_last, numbers_available}
  end

  def get_first_list(numbers_for_fill, pivot) do
    first_list = Enum.take(numbers_for_fill, pivot)
    numbers_available = numbers_for_fill -- first_list
    {first_list, numbers_available}
  end

  def fill_last_list({lists, numbers_available}, number) do
    [last_list|_t] = Enum.reverse(lists)
    indexes = Enum.to_list(1..(number-1))
    tail_last_list = for {_index, number} <- Enum.zip(indexes, numbers_available), do: number
    elements_in_list = Enum.reverse(tail_last_list)
    numbers_available = numbers_available -- elements_in_list
    last_list = elements_in_list ++ last_list
    {last_list, numbers_available}
  end

  def fill_last_element_in_lists(matrix, numbers) do
    size = length(matrix)
    numbers_available = numbers -- (Enum.take(numbers, size-1))
    [_list|tail] = matrix
    next_lists =
      for {list, number} <- Enum.zip(tail, numbers) do
        list ++ [number]
      end
    {next_lists, numbers_available}
  end

  def get_numbers_for_fill_matrix do
    fn number ->
      number * number
    end
  end

end
