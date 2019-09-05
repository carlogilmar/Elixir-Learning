defmodule LearningTest do
  use ExUnit.Case

  test "one edit" do
    one_edit = Facebook.Exercise2.one_edit_apart("cat", "dog")
    assert one_edit == false
  end
end
