defmodule MaxElixirPokeApiTest do
  use ExUnit.Case, async: true
  doctest MaxElixirPokeApi

  def is_bitstring_or_nil(value), do: is_bitstring(value) or is_nil(value)

  describe "Errors" do
    @tag :not_runnable
    test "resource invalid [aton]" do
      assert MaxElixirPokeApi.resource(:banana) == {:error, %{reason: "resource invalid."}}
    end

    @tag :not_runnable
    test "resource invalid [string]" do
      assert MaxElixirPokeApi.resource("banana") == {:error, %{reason: "resource invalid."}}
    end

    @tag :not_runnable
    test "resource invalid [number]" do
      assert MaxElixirPokeApi.resource(1) == {:error, %{reason: "resource invalid."}}
    end
  end

  describe "Berries" do
    @tag :not_runnable
    test "berry resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:berry)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "berry_firmness resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:berry_firmness)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "berry_flavor resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:berry_flavor)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end
  end

  describe "Contests" do
    @tag :not_runnable
    test "contest_type resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:contest_type)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "contest_effect resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:contest_effect)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "super_contest_effect resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:super_contest_effect)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end
  end

  describe "Encounters" do
    @tag :not_runnable
    test "encounter_method resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:encounter_method)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "encounter_condition resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:encounter_condition)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "encounter_condition_value resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:encounter_condition_value)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end
  end

  describe "Evolution" do
    @tag :not_runnable
    test "evolution_chain resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:evolution_chain)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "evolution_trigger resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:evolution_trigger)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end
  end

  describe "Games" do
    @tag :not_runnable
    test "generation resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:generation)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "pokedex resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:pokedex)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "version resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:version)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "version_group resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:version_group)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end
  end

  describe "Items" do
    @tag :not_runnable
    test "item resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:item)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "item_attribute resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:item_attribute)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "item_category resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:item_category)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "item_fling_effect resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:item_fling_effect)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "item_pocket resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:item_pocket)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end
  end

  describe "Locations" do
    @tag :not_runnable
    test "location resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:location)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "location_area resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:location_area)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "pal_park_area resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:pal_park_area)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "region resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:region)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end
  end

  describe "Machines" do
    @tag :not_runnable
    test "machine resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:machine)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end
  end

  describe "Moves" do
    @tag :not_runnable
    test "move resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:move)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "move_ailment resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:move_ailment)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "move_battle_style resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:move_battle_style)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "move_category resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:move_category)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "move_damage_class resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:move_damage_class)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "move_learn_method resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:move_learn_method)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "move_target resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:move_target)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end
  end

  describe "Pokémon" do
    @tag :not_runnable
    test "ability resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:ability)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "characteristic resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:characteristic)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "egg_group resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:egg_group)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "gender resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:gender)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "growth_rate resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:growth_rate)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "nature resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:nature)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "pokeathlon_stat resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:pokeathlon_stat)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "pokemon resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:pokemon)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "pokemon_color resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:pokemon_color)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "pokemon_form resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:pokemon_form)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "pokemon_habitat resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:pokemon_habitat)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "pokemon_shape resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:pokemon_shape)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "pokemon_species resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:pokemon_species)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "stat resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:stat)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "type resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:type)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end
  end

  describe "Utility" do
    @tag :not_runnable
    test "language resource" do
      { :ok, resource } = MaxElixirPokeApi.resource(:language)

      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end
  end
end
