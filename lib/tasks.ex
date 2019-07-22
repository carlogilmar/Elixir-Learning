defmodule MyTasker do

  def get_funcs() do
    fun1 = fn -> IO.puts "1) Procesando..."; :timer.sleep(2000); :res1 end
    fun2 = fn -> IO.puts "2) Procesando..."; :timer.sleep(9000); :res2 end
    fun3 = fn -> IO.puts "3) Procesando..."; :timer.sleep(4000); :res3 end
    [fun1, fun2, fun3]
  end

  def execute_secuential() do
    funcs = get_funcs()
    start = :os.system_time(:millisecond)
    Enum.each(funcs, fn f -> f.() end)
    final = :os.system_time(:millisecond)
    duration = (final - start)/1000
    IO.puts "Duración: #{duration}"
  end

  def execute_async() do
    funcs = get_funcs()
    start = :os.system_time(:millisecond)
    funcs
      |> Enum.map(fn fun -> Task.async(fun) end)
      |> Enum.map(fn task_pid -> Task.await(task_pid, 9000) end)
    final = :os.system_time(:millisecond)
    duration = (final - start)/1000
    IO.puts "Duración: #{duration}"
  end

  defp get_funcs_with_params do
    fun1 = fn x -> IO.puts "1) Procesando..."; :timer.sleep(2000); x+100 end
    fun2 = fn x -> IO.puts "2) Procesando..."; :timer.sleep(9000); x+200 end
    fun3 = fn x -> IO.puts "3) Procesando..."; :timer.sleep(4000); x+300 end
    [fun1, fun2, fun3]
  end

  def execute_async_with_params() do
    [fun1, fun2, fun3] = get_funcs_with_params()
    funcs = [{fun1, 12}, {fun2, 23}, {fun3, 32}]
    start = :os.system_time(:millisecond)
    funcs
      |> Enum.map(fn {fun, params} -> apply_func(fun, params) end)
      |> Enum.map(fn fun -> Task.async(fun) end)
      |> Enum.map(fn task_pid -> Task.await(task_pid, 9000) end)
    final = :os.system_time(:millisecond)
    duration = (final - start)/1000
    IO.puts "Duración: #{duration}"
  end

  def apply_func(fun, arg), do: fn -> fun.(arg) end

end
