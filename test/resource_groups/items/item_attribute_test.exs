defmodule MaxElixirPokeApi.ItemAttributeTest do
  use ExUnit.Case, async: true
  doctest MaxElixirPokeApi.ItemAttribute

  test "get/1 success" do
    { :ok, resource } = MaxElixirPokeApi.ItemAttribute.get("countable")

    assert resource["descriptions"] |> is_list
    assert resource["id"] |> is_integer
    assert resource["items"] |> is_list
    assert resource["name"] |> is_bitstring
    assert resource["names"] |> is_list
  end
end
