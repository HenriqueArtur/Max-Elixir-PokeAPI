defmodule MaxElixirPokeApi.Helper do
  @url "https://pokeapi.co/api/v2/"
  @http_client Application.get_env(:max_elixir_poke_api, :http_adapter, HTTPoison)

  def do_request(resource) do
    resource
    |> make_url
    |> client_get
    |> response
    |> decode
  end

  defp make_url(resource), do: @url <> resource

  defp client_get(url), do: @http_client.get(url)

  defp response(tuple), do: do_response(tuple)
  defp do_response({:ok, %{status_code: 200, body: body}}), do: {:ok, body}
  defp do_response({:ok, %{status_code: status_code}}), do: {:error, %{reason: "HTTP Status '#{status_code}'"}}
  defp do_response({:error, reason: reason}), do: {:error, reason: reason}

  defp decode(tuple), do: do_decode(tuple)
  defp do_decode({:error, _reason} = response), do: response
  defp do_decode({:ok, body}), do: {:ok, Jason.decode!(body)}
end