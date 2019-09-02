defmodule ExercisesTest do
  use ExUnit.Case

  test "Get a simple matrix" do
    number = 3
    expected_matrix = [[1, 2, 3], [8, 9, 4], [7, 6, 5]]
    matrix = FbExercises.generate_matrix(number)
    assert matrix == expected_matrix
  end
end
