defmodule MaxElixirPokeApiTest do
  use ExUnit.Case
  doctest MaxElixirPokeApi

  test "greets the world" do
    assert MaxElixirPokeApi.hello() == :world
  end
end
