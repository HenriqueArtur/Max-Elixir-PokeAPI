defmodule MaxElixirPokeApi.PokeAPI do
  @moduledoc false

  @http_client Application.compile_env(:max_elixir_poke_api, :http_client)
  @cache Application.compile_env(:max_elixir_poke_api, :cache)

  @type id_or_name :: String.t() | integer
  @type response :: {:ok, map} | {:error, %{reason: String.t()}}

  @url "https://pokeapi.co/api/v2/"

  @spec fetch(String.t(), integer, integer) :: response
  def fetch(resource, limit, page) do
    case @cache.exists?(:max_elixir_cache, resource) do
      {:ok, true} ->
        {:ok, value} = @cache.get(:max_elixir_cache, resource)
        value
      {:ok, false} ->
        resource
        |> make_url(limit, page)
        |> get_url
        |> save_cache(resource)
    end
  end

  @doc """
  Single Resource endpoint pipeline.
  """
  @spec fetch(String.t(), id_or_name) :: response
  def fetch(resource, id_or_name) do
    key = "#{resource}-#{id_or_name}"
    case @cache.exists?(:max_elixir_cache, key) do
      {:ok, true} ->
        {:ok, value} = @cache.get(:max_elixir_cache, key)
        value
      {:ok, false} ->
        resource
        |> make_url(id_or_name)
        |> get_url
        |> save_cache(key)
    end
  end

  defp get_url(url), do: @http_client.get(url)
  defp make_url(resource, id_or_name), do: "#{@url}#{resource}/#{to_string(id_or_name)}"
  defp make_url(resource, limit, page), do: "#{@url}#{resource}?limit=#{limit}&offset=#{limit * page}"

  defp save_cache(resource, key) do
    { _status, data }= @cache.put(:max_elixir_cache, key, resource)
    data
  end
end
