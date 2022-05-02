defmodule MaxElixirPokeApi.Http.Client do
  alias MaxElixirPokeApi.Constants.{URL}
  require Jason

  @behaviour MaxElixirPokeApi.Http.ClientBehaviour

  @http_client Application.get_env(:max_elixir_poke_api, :http_adapter, HTTPoison)

  @base URL.get()

  def get(url) do
    @base <> url
      |>@http_client.get()
      |>response()
      |>decode()
  end

  defp response({:ok, %{status_code: 200, body: body}}), do: {:ok, body}

  defp response({:ok, %{status_code: status_code}}), do: {:error, %{reason: "HTTP Status '#{status_code}'"}}

  defp response({:error, reason: reason}), do: {:error, reason: reason}

  defp decode({:ok, body}) do
    map = Jason.decode!(body)
    {:ok, map}
  end

  defp decode({:error, _reason} = response) do
    response
  end
end
