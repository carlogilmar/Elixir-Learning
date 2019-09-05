defmodule Facebook.Exercise2 do

  def one_edit_apart(key, word) do
    key = String.codepoints(key)
    word = String.codepoints(word)
    words_size = analize_length(length(key), length(word))
    analize({key, word, 0})
  end

  def analize_length(key, word) do
    max = key+1
    min = key-1
    max_comparation = word <= max
    min_comparation = min <= word
    validate.({max_comparation, min_comparation})
  end

  def validate do
    fn
      {false, false} -> false
      _ -> true
    end
  end

  def analize({_key, [], counter}), do: counter
  def analize({key, [letter|tail_word], counter}) do
    contains = Enum.member?(key, letter)
    counter = update_counter.({contains, counter})
    analize({key, tail_word, counter})
  end

  def update_counter do
    fn
      {true, counter} -> counter+1
      {false, counter} -> counter
    end
  end

end
