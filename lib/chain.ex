defmodule Chain do

  def try(opts) do
    with {:ok, width} <- Map.fetch(opts, :width),
         {:ok, height} <- Map.fetch(opts, :height) do
      {:ok, width * height}
    else
      :error -> {:error, :wrong_data}
    end
  end

  def rollback(job) do
    with {:ok, job} <- create_job(job) do
      :send_email
    else
      _ ->
        :errorz
    end
  end

  defp create_job(_job), do: {:ok, 0}

end
