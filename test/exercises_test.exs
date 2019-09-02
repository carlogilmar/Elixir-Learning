defmodule ExercisesTest do
  use ExUnit.Case

  #test "Get a simple matrix" do
  #  number = 3
  #  expected_matrix = [[1, 2, 3], [8, 9, 4], [7, 6, 5]]
  #  matrix = FbExercises.generate_matrix(number)
  #  assert matrix == expected_matrix
  #end
  #
  test "generate model" do
    model = FbExercises.generate_model(4)
    assert model == {[[],[],[],[]], [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16], 4}
  end

  test  "Add first line" do
    model = FbExercises.fill_first_list({[[],[],[],[]], [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16], 4})
    assert model == {[[1,2,3,4],[],[],[]], [5,6,7,8,9,10,11,12,13,14,15,16], 4}
  end

  test "Add last_line" do
    model = FbExercises.fill_last_list({[[1,2,3,4],[],[],[]], [5,6,7,8,9,10,11,12,13,14,15,16], 4})
    assert model == {[[1,2,3,4],[],[],[10,9,8,7]], [5,6,11,12,13,14,15,16], 4}
  end

  test "Fill last vertx" do
    model = FbExercises.put_last_vertx({[[1,2,3,4],[],[],[10,9,8,7]], [5,6,11,12,13,14,15,16], 4})
    assert model == {[[1,2,3,4],[5],[6],[10,9,8,7]], [11,12,13,14,15,16], 4}
  end

  test "Fill first row" do
    model = FbExercises.put_first_row({[[1,2,3,4],[5],[6],[10,9,8,7]], [11,12,13,14,15,16], 4})
    assert model == {[[1,2,3,4],[12,5],[11,6],[10,9,8,7]], [13,14,15,16], 4}
  end

end
