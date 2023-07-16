defmodule MaxElixirPokeApi.HttpClient do
  @behaviour MaxElixirPokeApi.HttpClient.Behaviour

  def get(url) do
    HTTPoison.get(url)
    |> response
    |> decode
  end

  @doc false
  defp response({:ok, %{status_code: 200, body: body}}), do: {:ok, body}
  defp response({:ok, %{status_code: status_code}}), do: {:error, %{reason: "HTTP Status '#{status_code}'"}}
  defp response({:error, reason}), do: {:error, reason: reason}

  @doc false
  defp decode({:error, _reason} = response), do: response
  defp decode({:ok, body}), do: {:ok, Jason.decode!(body)}
end
