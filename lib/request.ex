defmodule MaxElixirPokeApi.Request do
  @moduledoc false

  @type id_or_name :: String.t() | integer

  @url "https://pokeapi.co/api/v2/"
  @http_client Application.get_env(:max_elixir_poke_api, :http_adapter, HTTPoison)

  @doc """
  Request pipeline.
  """
  @spec get(String.t(), integer, integer) :: {:ok, map} | {:error, %{reason: String.t()}}
  def get(resource, limit, page) do
    resource
    |> make_url(limit, page)
    |> client_get
    |> response
    |> decode
  end

  @spec get(String.t(), id_or_name) :: {:ok, map} | {:error, %{reason: String.t()}}
  def get(resource, id_or_name) do
    resource
    |> make_url(id_or_name)
    |> client_get
    |> response
    |> decode
  end

  # @doc false
  defp make_url(resource, id_or_name), do: @url <> resource <> "/" <> to_string(id_or_name)
  @doc false
  defp make_url(resource, limit, page), do: @url <> resource <> "?limit=#{limit}&offset=#{limit * page}"

  @doc false
  defp client_get(url), do: @http_client.get(url)

  @doc false
  defp response(tuple), do: do_response(tuple)
  @doc false
  defp do_response({:ok, %{status_code: 200, body: body}}), do: {:ok, body}
  @doc false
  defp do_response({:ok, %{status_code: status_code}}), do: {:error, %{reason: "HTTP Status '#{status_code}'"}}
  @doc false
  defp do_response({:error, reason}), do: {:error, reason: reason}

  @doc false
  defp decode(tuple), do: do_decode(tuple)
  @doc false
  defp do_decode({:error, _reason} = response), do: response
  @doc false
  defp do_decode({:ok, body}), do: {:ok, Jason.decode!(body)}
end
