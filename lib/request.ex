defmodule MaxElixirPokeApi.Request do
  @moduledoc false

  @type id_or_name :: String.t() | integer
  @type response :: {:ok, map} | {:error, %{reason: String.t()}}

  @url "https://pokeapi.co/api/v2/"
  @http_client Application.get_env(:max_elixir_poke_api, :http_adapter, HTTPoison)

  @doc """
  Resource List endpoint pipeline.
  """
  @spec get(String.t(), integer, integer) :: response
  def get(resource, limit, page) do
    if resource do
      resource
      |> make_url(limit, page)
      |> client_get
      |> response
      |> decode
    else
      {:error, %{reason: "resource not valid."}}
    end
  end

  @doc """
  Single Resource endpoint pipeline.
  """
  @spec get(String.t(), id_or_name) :: response
  def get(resource, id_or_name) do
    resource
    |> make_url(id_or_name)
    |> client_get
    |> response
    |> decode
  end

  @doc false
  defp make_url(resource, id_or_name), do: "#{@url}#{resource}/#{to_string(id_or_name)}"
  defp make_url(resource, limit, page), do: "#{@url}#{resource}?limit=#{limit}&offset=#{limit * page}"

  @doc false
  defp client_get(url), do: @http_client.get(url)

  @doc false
  defp response({:ok, %{status_code: 200, body: body}}), do: {:ok, body}
  defp response({:ok, %{status_code: status_code}}), do: {:error, %{reason: "HTTP Status '#{status_code}'"}}
  defp response({:error, reason}), do: {:error, reason: reason}

  @doc false
  defp decode({:error, _reason} = response), do: response
  defp decode({:ok, body}), do: {:ok, Jason.decode!(body)}
end
