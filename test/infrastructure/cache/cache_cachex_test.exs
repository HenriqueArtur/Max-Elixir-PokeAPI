defmodule MaxElixirPokeApi.Cache.CachexTest do
  use ExUnit.Case

  setup do
    Cachex.clear(:max_elixir_cache)
    :ok
  end

  test "should exists?/2 NOT exist data" do
    assert {:ok, false} == MaxElixirPokeApi.Cache.Cachex.exists?(:max_elixir_cache, "exists?/2")
  end

  test "should exists?/2 EXIST data" do
    Cachex.put(:max_elixir_cache, "exists?/2", "test")
    assert {:ok, true} == MaxElixirPokeApi.Cache.Cachex.exists?(:max_elixir_cache, "exists?/2")
  end

  test "should get/2 NOT exist data" do
    assert {:ok, nil} == MaxElixirPokeApi.Cache.Cachex.get(:max_elixir_cache, "get/2")
  end

  test "should get/2 EXIST data" do
    Cachex.put(:max_elixir_cache, "get/2", "test")
    assert {:ok, "test"} == MaxElixirPokeApi.Cache.Cachex.get(:max_elixir_cache, "get/2")
  end

  test "should put/3 a data" do
    assert {:ok, "test"} == MaxElixirPokeApi.Cache.Cachex.put(:max_elixir_cache, "put/3", "test")
  end
end
