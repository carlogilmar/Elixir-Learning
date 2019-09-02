defmodule ExercisesTest do
  use ExUnit.Case

  #test "Get a simple matrix" do
  #  number = 3
  #  expected_matrix = [[1, 2, 3], [8, 9, 4], [7, 6, 5]]
  #  matrix = FbExercises.generate_matrix(number)
  #  assert matrix == expected_matrix
  #end

  test "get a matrix with 4 " do
    number = 4
    expected_matrix =
      [
        [1,2,3,4],
        [12,13,14,5],
        [11,16,15,6],
        [10, 9, 8, 7]
      ]
    matrix = FacebookBuilder.generate_matrix(number)
    assert matrix == expected_matrix
  end
end
