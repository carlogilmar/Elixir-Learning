defmodule InverseCaptcha do

  def start(captcha) do
    String.codepoints(captcha)
      |> parserToInteger
  end

  def parserToInteger( [h|t] ) do
    {parsedInteger,_} = Integer.parse(h)
    [ parsedInteger ] ++ parserToInteger(t)
  end
  def parserToInteger( [] ), do: []

end
