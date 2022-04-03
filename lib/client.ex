defmodule Client do
  alias Constant.URL, as: URL
  require Jason

  @base URL.get()

  def get(url) do
    @base <> url
      |>HTTPoison.get()
      |>response()
      |>decode()
  end

  defp response({:ok, %{status_code: 200, body: body}}), do: {:ok, body}
  defp response({:ok, %{status_code: status_code}}), do: {:error, "HTTP Status '#{status_code}'"}
  defp response({:error, %{reason: reason}}), do: {:error, reason}

  defp decode({:ok, body}) do
    Jason.decode!(body)
  end

  defp decode({:error, _reason} = response) do
    response
  end
end
