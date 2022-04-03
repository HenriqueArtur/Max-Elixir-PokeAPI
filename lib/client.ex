defmodule Client do
  alias Constant.URL, as: URL

  @base URL.get()

  def get(url) do
    @base <> url
      |>HTTPoison.get()
      |>response()
  end

  defp response({:ok, %{status_code: 200, body: body}}), do: {:ok, body}
  defp response({:ok, %{status_code: status_code}}), do: {:error, "HTTP Status '#{status_code}'"}
  defp response({:error, %{reason: reason}}), do: {:error, reason}
end
