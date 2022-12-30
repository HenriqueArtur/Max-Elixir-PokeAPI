defmodule MaxElixirPokeApi.PokedexTest do
  use ExUnit.Case, async: true
  doctest MaxElixirPokeApi.Pokedex

  test "get/1 success" do
    { :ok, resource } = MaxElixirPokeApi.Pokedex.get("kanto")

    assert resource["descriptions"] |> is_list
    assert resource["id"] |> is_integer
    assert resource["is_main_series"] |> is_boolean
    assert resource["name"] |> is_bitstring
    assert resource["names"] |> is_list
    assert resource["pokemon_entries"] |> is_list
    assert resource["region"] |> is_map
    assert resource["version_groups"] |> is_list
  end
end
