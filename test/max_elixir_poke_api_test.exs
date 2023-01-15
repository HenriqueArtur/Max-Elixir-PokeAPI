defmodule MaxElixirPokeApiTest do
  use ExUnit.Case, async: true
  doctest MaxElixirPokeApi

  defp is_bitstring_or_nil(value), do: is_bitstring(value) or is_nil(value)
  defp is_integer_or_nil(value), do: is_integer(value) or is_nil(value)
  defp is_map_or_nil(value), do: is_map(value) or is_nil(value)

  @tag :not_runnable
  test "caching" do
    assert Cachex.exists?(:max_elixir_cache, "berry-1") == {:ok, false}
    MaxElixirPokeApi.berry(1)
    assert Cachex.exists?(:max_elixir_cache, "berry-1") == {:ok, true}
  end

  describe "resource/3" do
    @tag :not_runnable
    test "success NOT paginate" do
      { :ok, resource } = MaxElixirPokeApi.resource(:pokemon)
      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "success paginate" do
      { :ok, resource } = MaxElixirPokeApi.resource(:pokemon, 5, 5)
      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring
      assert resource["previous"] |> is_bitstring
      assert resource["results"] |> is_list
    end

    @tag :not_runnable
    test "resource not valid" do
      assert MaxElixirPokeApi.resource(:banana) == {:error, %{reason: "resource not valid."}}
    end

    @tag :not_runnable
    test "datatype invalid [string]" do
      assert catch_error(MaxElixirPokeApi.resource("banana")) == :function_clause
    end
  end

  describe "berry/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.berry("cheri")
      assert resource["id"] |> is_integer
      assert resource["name"] |> is_bitstring
      assert resource["firmness"] |> is_map
      assert resource["flavors"] |> is_list
      assert resource["growth_time"] |> is_integer
      assert resource["item"] |> is_map
      assert resource["max_harvest"] |> is_integer
      assert resource["natural_gift_power"] |> is_integer
      assert resource["natural_gift_type"] |> is_map
      assert resource["size"] |> is_integer
      assert resource["smoothness"] |> is_integer
      assert resource["soil_dryness"] |> is_integer
    end

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.berry("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.berry(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.berry(:banana)) == :function_clause
    end
  end

  describe "berry_firmness/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.berry_firmness("very-soft")
      assert resource["id"] |> is_integer
      assert resource["name"] |> is_bitstring
      assert resource["names"] |> is_list
      assert resource["berries"] |> is_list
    end

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.berry_firmness("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.berry_firmness(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.berry_firmness(:banana)) == :function_clause
    end
  end

  describe "berry_flavor/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.berry_flavor("spicy")
      assert resource["id"] |> is_integer
      assert resource["name"] |> is_bitstring
      assert resource["names"] |> is_list
      assert resource["berries"] |> is_list
    end

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.berry_flavor("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.berry_flavor(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.berry_flavor(:banana)) == :function_clause
    end
  end

  describe "contest_type/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.contest_type("cool")
      assert resource["id"] |> is_integer
      assert resource["name"] |> is_bitstring
      assert resource["names"] |> is_list
      assert resource["berry_flavor"] |> is_map
    end

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.contest_type("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.contest_type(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.contest_type(:banana)) == :function_clause
    end
  end

  describe "contest_effect/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.contest_effect(1)
      assert resource["id"] |> is_integer
      assert resource["jam"] |> is_integer
      assert resource["appeal"] |> is_integer
      assert resource["effect_entries"] |> is_list
      assert resource["flavor_text_entries"] |> is_list
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.contest_effect(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.contest_effect(:banana)) == :function_clause
    end
  end

  describe "super_contest_effect/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.super_contest_effect(1)
      assert resource["id"] |> is_integer
      assert resource["appeal"] |> is_integer
      assert resource["moves"] |> is_list
      assert resource["flavor_text_entries"] |> is_list
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.super_contest_effect(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.super_contest_effect(:banana)) == :function_clause
    end
  end

  describe "encounter_method/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.encounter_method("walk")
      assert resource["id"] |> is_integer
      assert resource["name"] |> is_bitstring
      assert resource["names"] |> is_list
      assert resource["order"] |> is_integer
    end

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.encounter_method("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.encounter_method(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.encounter_method(:banana)) == :function_clause
    end
  end

  describe "encounter_condition/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.encounter_condition("swarm")
      assert resource["id"] |> is_integer
      assert resource["name"] |> is_bitstring
      assert resource["names"] |> is_list
      assert resource["values"] |> is_list
    end

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.encounter_condition("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.encounter_condition(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.encounter_condition(:banana)) == :function_clause
    end
  end

  describe "encounter_condition_value/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.encounter_condition_value("swarm-yes")
      assert resource["id"] |> is_integer
      assert resource["name"] |> is_bitstring
      assert resource["names"] |> is_list
      assert resource["condition"] |> is_map
    end

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.encounter_condition_value("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.encounter_condition_value(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.encounter_condition_value(:banana)) == :function_clause
    end
  end

  describe "evolution_chain/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.evolution_chain(1)
      assert resource["id"] |> is_integer
      assert resource["chain"] |> is_map
      assert resource["baby_trigger_item"] |> is_map_or_nil
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.evolution_chain(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.evolution_chain(:banana)) == :function_clause
    end
  end

  describe "evolution_trigger/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.evolution_trigger("trade")
      assert resource["id"] |> is_integer
      assert resource["name"] |> is_bitstring
      assert resource["names"] |> is_list
      assert resource["pokemon_species"] |> is_list
    end

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.evolution_trigger("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.evolution_trigger(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.evolution_trigger(:banana)) == :function_clause
    end
  end

  describe "generation/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.generation("generation-i")
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

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.generation("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.generation(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.generation(:banana)) == :function_clause
    end
  end

  describe "pokedex/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.pokedex("kanto")
      assert resource["descriptions"] |> is_list
      assert resource["id"] |> is_integer
      assert resource["is_main_series"] |> is_boolean
      assert resource["name"] |> is_bitstring
      assert resource["names"] |> is_list
      assert resource["pokemon_entries"] |> is_list
      assert resource["region"] |> is_map
      assert resource["version_groups"] |> is_list
    end

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.pokedex("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.pokedex(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.pokedex(:banana)) == :function_clause
    end
  end

  describe "version/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.version("red")
      assert resource["id"] |> is_integer
      assert resource["name"] |> is_bitstring
      assert resource["names"] |> is_list
      assert resource["version_group"] |> is_map
    end

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.version("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.version(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.version(:banana)) == :function_clause
    end
  end

  describe "version_group/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.version_group("red-blue")
      assert resource["id"] |> is_integer
      assert resource["order"] |> is_integer
      assert resource["name"] |> is_bitstring
      assert resource["versions"] |> is_list
      assert resource["generation"] |> is_map
      assert resource["move_learn_methods"] |> is_list
      assert resource["pokedexes"] |> is_list
      assert resource["regions"] |> is_list
      assert resource["versions"] |> is_list
    end

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.version_group("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.version_group(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.version_group(:banana)) == :function_clause
    end
  end

  describe "item/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.item("master-ball")
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

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.item("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.item(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.item(:banana)) == :function_clause
    end
  end

  describe "item_attribute/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.item_attribute("countable")
      assert resource["descriptions"] |> is_list
      assert resource["id"] |> is_integer
      assert resource["items"] |> is_list
      assert resource["name"] |> is_bitstring
      assert resource["names"] |> is_list
    end

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.item_attribute("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.item_attribute(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.item_attribute(:banana)) == :function_clause
    end
  end

  describe "item_category/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.item_category("stat-boosts")
      assert resource["id"] |> is_integer
      assert resource["name"] |> is_bitstring
      assert resource["names"] |> is_list
      assert resource["items"] |> is_list
      assert resource["pocket"] |> is_map
    end

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.item_category("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.item_category(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.item_category(:banana)) == :function_clause
    end
  end

  describe "item_fling_effect/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.item_fling_effect("badly-poison")
      assert resource["id"] |> is_integer
      assert resource["name"] |> is_bitstring
      assert resource["items"] |> is_list
      assert resource["effect_entries"] |> is_list
    end

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.item_fling_effect("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.item_fling_effect(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.item_fling_effect(:banana)) == :function_clause
    end
  end

  describe "item_pocket/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.item_pocket("misc")
      assert resource["id"] |> is_integer
      assert resource["name"] |> is_bitstring
      assert resource["names"] |> is_list
      assert resource["categories"] |> is_list
    end

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.item_pocket("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.item_pocket(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.item_pocket(:banana)) == :function_clause
    end
  end

  describe "location/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.location("canalave-city")
      assert resource["id"] |> is_integer
      assert resource["name"] |> is_bitstring
      assert resource["names"] |> is_list
      assert resource["region"] |> is_map
      assert resource["areas"] |> is_list
      assert resource["game_indices"] |> is_list
    end

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.location("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.location(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.location(:banana)) == :function_clause
    end
  end

  describe "location_area/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.location_area("canalave-city-area")
      assert resource["id"] |> is_integer
      assert resource["game_index"] |> is_integer
      assert resource["name"] |> is_bitstring
      assert resource["names"] |> is_list
      assert resource["encounter_method_rates"] |> is_list
      assert resource["location"] |> is_map
      assert resource["pokemon_encounters"] |> is_list
    end

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.location_area("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.location_area(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.location_area(:banana)) == :function_clause
    end
  end

  describe "pal_park_area/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.pal_park_area("forest")
      assert resource["id"] |> is_integer
      assert resource["name"] |> is_bitstring
      assert resource["names"] |> is_list
      assert resource["pokemon_encounters"] |> is_list
    end

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.pal_park_area("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.pal_park_area(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.pal_park_area(:banana)) == :function_clause
    end
  end

  describe "region/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.region("kanto")
      assert resource["id"] |> is_integer
      assert resource["name"] |> is_bitstring
      assert resource["names"] |> is_list
      assert resource["locations"] |> is_list
      assert resource["main_generation"] |> is_map
      assert resource["pokedexes"] |> is_list
      assert resource["version_groups"] |> is_list
    end

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.region("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.region(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.region(:banana)) == :function_clause
    end
  end

  describe "machine/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.machine(1)
      assert resource["id"] |> is_integer
      assert resource["item"] |> is_map
      assert resource["move"] |> is_map
      assert resource["version_group"] |> is_map
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.machine(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.machine(:banana)) == :function_clause
    end
  end

  describe "move/1" do
    # @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.move("pound")
      assert resource["id"] |> is_integer
      assert resource["name"] |> is_bitstring
      assert resource["names"] |> is_list
      assert resource["accuracy"] |> is_integer
      assert resource["effect_chance"] |> is_integer_or_nil
      assert resource["pp"] |> is_integer
      assert resource["priority"] |> is_integer
      assert resource["power"] |> is_integer
      assert resource["contest_combos"] |> is_map_or_nil
      assert resource["contest_type"] |> is_map_or_nil
      assert resource["contest_effect"] |> is_map_or_nil
      assert resource["damage_class"] |> is_map
      assert resource["effect_entries"] |> is_list
      assert resource["effect_changes"] |> is_list
      assert resource["learned_by_pokemon"] |> is_list
      assert resource["flavor_text_entries"] |> is_list
      assert resource["generation"] |> is_map
      assert resource["machines"] |> is_list
      assert resource["meta"] |> is_map_or_nil
      assert resource["past_values"] |> is_list
      assert resource["stat_changes"] |> is_list
      assert resource["super_contest_effect"] |> is_map_or_nil
      assert resource["target"] |> is_map
      assert resource["type"] |> is_map
    end

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.move("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.move(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.move(:banana)) == :function_clause
    end
  end

  describe "move_ailment/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.move_ailment("paralysis")
      assert resource["id"] |> is_integer
      assert resource["name"] |> is_bitstring
      assert resource["names"] |> is_list
      assert resource["moves"] |> is_list
    end

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.move_ailment("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.move_ailment(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.move_ailment(:banana)) == :function_clause
    end
  end

  describe "move_battle_style/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.move_battle_style("attack")
      assert resource["id"] |> is_integer
      assert resource["name"] |> is_bitstring
      assert resource["names"] |> is_list
    end

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.move_battle_style("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.move_battle_style(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.move_battle_style(:banana)) == :function_clause
    end
  end

  describe "move_category/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.move_category("ailment")
      assert resource["id"] |> is_integer
      assert resource["name"] |> is_bitstring
      assert resource["moves"] |> is_list
      assert resource["descriptions"] |> is_list
    end

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.move_category("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.move_category(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.move_category(:banana)) == :function_clause
    end
  end

  describe "move_damage_class/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.move_damage_class("status")
      assert resource["id"] |> is_integer
      assert resource["name"] |> is_bitstring
      assert resource["names"] |> is_list
      assert resource["moves"] |> is_list
      assert resource["descriptions"] |> is_list
    end

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.move_damage_class("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.move_damage_class(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.move_damage_class(:banana)) == :function_clause
    end
  end

  describe "move_learn_method/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.move_learn_method("level-up")
      assert resource["id"] |> is_integer
      assert resource["name"] |> is_bitstring
      assert resource["names"] |> is_list
      assert resource["version_groups"] |> is_list
      assert resource["descriptions"] |> is_list
    end

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.move_learn_method("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.move_learn_method(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.move_learn_method(:banana)) == :function_clause
    end
  end

  describe "move_target/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.move_target("specific-move")
      assert resource["id"] |> is_integer
      assert resource["name"] |> is_bitstring
      assert resource["names"] |> is_list
      assert resource["moves"] |> is_list
      assert resource["descriptions"] |> is_list
    end

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.move_target("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.move_target(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.move_target(:banana)) == :function_clause
    end
  end

  describe "ability/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.ability("stench")
      assert resource["id"] |> is_integer
      assert resource["name"] |> is_bitstring
      assert resource["names"] |> is_list
      assert resource["is_main_series"] |> is_boolean
      assert resource["generation"] |> is_map
      assert resource["effect_entries"] |> is_list
      assert resource["effect_changes"] |> is_list
      assert resource["flavor_text_entries"] |> is_list
      assert resource["pokemon"] |> is_list
    end

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.ability("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.ability(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.ability(:banana)) == :function_clause
    end
  end

  describe "characteristic/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.characteristic(1)
      assert resource["id"] |> is_integer
      assert resource["gene_modulo"] |> is_integer
      assert resource["possible_values"] |> is_list
      assert resource["highest_stat"] |> is_map
      assert resource["descriptions"] |> is_list
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.characteristic(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.characteristic(:banana)) == :function_clause
    end
  end

  describe "egg_group/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.egg_group("monster")
      assert resource["id"] |> is_integer
      assert resource["name"] |> is_bitstring
      assert resource["names"] |> is_list
      assert resource["pokemon_species"] |> is_list
    end

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.egg_group("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.egg_group(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.egg_group(:banana)) == :function_clause
    end
  end

  describe "gender/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.gender("female")
      assert resource["id"] |> is_integer
      assert resource["name"] |> is_bitstring
      assert resource["pokemon_species_details"] |> is_list
      assert resource["required_for_evolution"] |> is_list
    end

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.gender("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.gender(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.gender(:banana)) == :function_clause
    end
  end

  describe "growth_rate/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.growth_rate("slow")
      assert resource["id"] |> is_integer
      assert resource["name"] |> is_bitstring
      assert resource["formula"] |> is_bitstring
      assert resource["descriptions"] |> is_list
      assert resource["levels"] |> is_list
      assert resource["pokemon_species"] |> is_list
    end

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.growth_rate("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.growth_rate(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.growth_rate(:banana)) == :function_clause
    end
  end

  describe "nature/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.nature("bold")
      assert resource["id"] |> is_integer
      assert resource["name"] |> is_bitstring
      assert resource["names"] |> is_list
      assert resource["decreased_stat"] |> is_map
      assert resource["increased_stat"] |> is_map
      assert resource["likes_flavor"] |> is_map
      assert resource["hates_flavor"] |> is_map
      assert resource["pokeathlon_stat_changes"] |> is_list
      assert resource["move_battle_style_preferences"] |> is_list
    end

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.nature("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.nature(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.nature(:banana)) == :function_clause
    end
  end

  describe "pokeathlon_stat/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.pokeathlon_stat("speed")
      assert resource["id"] |> is_integer
      assert resource["name"] |> is_bitstring
      assert resource["names"] |> is_list
      assert resource["affecting_natures"] |> is_map
    end

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.pokeathlon_stat("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.pokeathlon_stat(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.pokeathlon_stat(:banana)) == :function_clause
    end
  end

  describe "pokemon/1" do
    @tag :not_runnable
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.pokemon("clefairy")
      assert resource["id"] |> is_integer
      assert resource["name"] |> is_bitstring
      assert resource["base_experience"] |> is_integer
      assert resource["height"] |> is_integer
      assert resource["is_default"] |> is_boolean
      assert resource["order"] |> is_integer
      assert resource["weight"] |> is_integer
      assert resource["abilities"] |> is_list
      assert resource["forms"] |> is_list
      assert resource["game_indices"] |> is_list
      assert resource["held_items"] |> is_list
      assert resource["location_area_encounters"] |> is_bitstring
      assert resource["moves"] |> is_list
      assert resource["species"] |> is_map
      assert resource["sprites"] |> is_map
      assert resource["stats"] |> is_list
      assert resource["types"] |> is_list
      assert resource["past_types"] |> is_list
    end

    @tag :not_runnable
    test "name not found" do
      assert MaxElixirPokeApi.pokemon("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "id not found" do
      assert MaxElixirPokeApi.pokemon(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    @tag :not_runnable
    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.pokemon(:banana)) == :function_clause
    end
  end
end
