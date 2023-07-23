defmodule MaxElixirPokeApi.Cache.Cachex do
  @moduledoc false

  @behaviour MaxElixirPokeApi.Cache.Behaviour

  def exists?(cache, key), do: Cachex.exists?(cache, key)

  def get(cache, key), do: Cachex.get(cache, key)

  def put(cache, key, data) do
    Cachex.put(cache, key, data)
    { :ok, data }
  end
end
