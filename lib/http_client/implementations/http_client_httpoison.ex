defmodule MaxElixirPokeApi.HttpClient.HTTPoison do
  @behaviour MaxElixirPokeApi.HttpClient

  @impl true
  def get(url) do
    url
    |> get_url
    |> response
    |> decode
  end

  defp get_url(url), do: HTTPoison.get(url)

  @doc false
  defp response({:ok, %{status_code: 200, body: body}}), do: {:ok, body}
  defp response({:ok, %{status_code: status_code}}), do: {:error, %{reason: "HTTP Status '#{status_code}'"}}
  defp response({:error, _reason} = err), do: err

  @doc false
  defp decode({:error, _reason} = response), do: response
  defp decode({:ok, body}), do: {:ok, Jason.decode!(body)}
end
