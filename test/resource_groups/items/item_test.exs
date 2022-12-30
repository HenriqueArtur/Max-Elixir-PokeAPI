defmodule MaxElixirPokeApi.ItemTest do
  use ExUnit.Case, async: true
  doctest MaxElixirPokeApi.Item

  def is_map_or_nil(value), do: is_map(value) or is_nil(value)
  def is_integer_or_nil(value), do: is_integer(value) or is_nil(value)

  test "get/1 success" do
    { :ok, resource } = MaxElixirPokeApi.Item.get("master-ball")

    assert resource["attributes"] |> is_list
    assert resource["baby_trigger_for"] |> is_map_or_nil
    assert resource["category"] |> is_map
    assert resource["cost"] |> is_integer
    assert resource["effect_entries"] |> is_list
    assert resource["flavor_text_entries"] |> is_list
    assert resource["fling_effect"] |> is_map_or_nil
    assert resource["fling_power"] |> is_integer_or_nil
    assert resource["game_indices"] |> is_list
    assert resource["held_by_pokemon"] |> is_list
    assert resource["id"] |> is_integer
    assert resource["machines"] |> is_list
    assert resource["name"] |> is_bitstring
    assert resource["names"] |> is_list
    assert resource["sprites"] |> is_map_or_nil
  end
end
