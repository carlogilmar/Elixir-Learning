defmodule Counters do

  def get_teachers() do
    [
        %{teacher_name: "carlo"},
        %{teacher_name: "gilmar"},
        %{teacher_name: "carlo"},
        %{teacher_name: "carlo"},
        %{teacher_name: "carlogilmar"},
        %{teacher_name: "gilamr"},
        %{teacher_name: "carlo"}
    ]
  end

  def get_counters() do
    [%{"carlo" => 0}, %{"gilmar" => 0}, %{"carlogilmar" => 0}, %{"gilamr" => 0}]
  end

end

IO.puts "Init"
