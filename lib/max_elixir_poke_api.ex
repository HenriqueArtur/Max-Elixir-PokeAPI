defmodule MaxElixirPokeApi do
  @url "https://pokeapi.co/api/v2/"

  @http_client Application.get_env(:max_elixir_poke_api, :http_adapter, HTTPoison)

  def get(:berry) do
    @url <> "berry"
    |> @http_client.get()
    |> get_response()
    |> decode
  end

  defp get_response({:ok, %{status_code: 200, body: body}}), do: {:ok, body}
  defp get_response({:ok, %{status_code: status_code}}), do: {:error, %{reason: "HTTP Status '#{status_code}'"}}
  defp get_response({:error, reason: reason}), do: {:error, reason: reason}

  defp decode({:error, _reason} = response), do: response
  defp decode({:ok, body}) do
    map = Jason.decode!(body)
    {:ok, map}
  end
end
