defmodule MaxElixirPokeApi.GenerationTest do
  use ExUnit.Case, async: true
  doctest MaxElixirPokeApi.Generation

  test "get/1 success" do
    { :ok, resource } = MaxElixirPokeApi.Generation.get("generation-i")

    assert resource["abilities"] |> is_list
    assert resource["id"] |> is_integer
    assert resource["main_region"] |> is_map
    assert resource["moves"] |> is_list
    assert resource["name"] |> is_bitstring
    assert resource["names"] |> is_list
    assert resource["pokemon_species"] |> is_list
    assert resource["types"] |> is_list
    assert resource["version_groups"] |> is_list
  end
end
