defmodule MaxElixirPokeApi.PokeAPITest do
  use ExUnit.Case
  use Patch

  @http_client Application.compile_env(:max_elixir_poke_api, :http_client)
  @cache Application.compile_env(:max_elixir_poke_api, :cache)

  test "should fetch/3 returns valid response cached" do
    patch(@cache, :exists?, {:ok, true})
    patch(@cache, :get, {:ok, %{}})
    assert %{} == MaxElixirPokeApi.PokeAPI.fetch("pokemon", 10, 1)
  end

  test "should fetch/3 returns valid response NOT cached" do
    patch(@cache, :exists?, {:ok, false})
    patch(@http_client, :get, %{})
    patch(@cache, :put, {:ok, %{}})
    assert %{} == MaxElixirPokeApi.PokeAPI.fetch("pokemon", 10, 1)
  end

  test "should fetch/2 returns valid response cached ID" do
    patch(@cache, :exists?, {:ok, true})
    patch(@cache, :get, {:ok, %{}})
    assert %{} == MaxElixirPokeApi.PokeAPI.fetch("berry", 1)
  end

  test "should fetch/2 returns valid response NOT cached ID" do
    patch(@cache, :exists?, {:ok, false})
    patch(@http_client, :get, %{})
    patch(@cache, :put, {:ok, %{}})
    assert %{} == MaxElixirPokeApi.PokeAPI.fetch("berry", 1)
  end

  test "should fetch/2 returns valid response cached Named" do
    patch(@cache, :exists?, {:ok, true})
    patch(@cache, :get, {:ok, %{}})
    assert %{} == MaxElixirPokeApi.PokeAPI.fetch("berry", "cheri")
  end

  test "should fetch/2 returns valid response NOT cached Named" do
    patch(@cache, :exists?, {:ok, false})
    patch(@http_client, :get, %{})
    patch(@cache, :put, {:ok, %{}})
    assert %{} == MaxElixirPokeApi.PokeAPI.fetch("berry", "cheri")
  end
end