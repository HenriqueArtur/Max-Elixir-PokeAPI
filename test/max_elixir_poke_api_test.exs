defmodule MaxElixirPokeApiTest do
  use ExUnit.Case, async: true
  doctest MaxElixirPokeApi

  def is_bitstring_or_nil(value), do: is_bitstring(value) or is_nil(value)

  describe "resource/3" do
    test "success NOT paginate" do
      { :ok, resource } = MaxElixirPokeApi.resource(:pokemon)
      assert resource["count"] |> is_integer
      assert resource["next"] |> is_bitstring_or_nil
      assert resource["previous"] |> is_bitstring_or_nil
      assert resource["results"] |> is_list
    end

    test "success paginate" do
      response =
        {:ok,
          %{
            "count" => 1154,
            "next" => "https://pokeapi.co/api/v2/pokemon?offset=30&limit=5",
            "previous" => "https://pokeapi.co/api/v2/pokemon?offset=20&limit=5",
            "results" => [
              %{"name" => "raichu", "url" => "https://pokeapi.co/api/v2/pokemon/26/"},
              %{"name" => "sandshrew", "url" => "https://pokeapi.co/api/v2/pokemon/27/"},
              %{"name" => "sandslash", "url" => "https://pokeapi.co/api/v2/pokemon/28/"},
              %{"name" => "nidoran-f", "url" => "https://pokeapi.co/api/v2/pokemon/29/"},
              %{"name" => "nidorina", "url" => "https://pokeapi.co/api/v2/pokemon/30/"}
            ]
          }}
      assert response == MaxElixirPokeApi.resource(:pokemon, 5, 5)
    end

    test "resource not valid" do
      assert MaxElixirPokeApi.resource(:banana) == {:error, %{reason: "resource not valid."}}
    end

    test "datatype invalid [string]" do
      assert catch_error(MaxElixirPokeApi.resource("banana")) == :function_clause
    end
  end

  describe "berry/1" do
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

    test "name not found" do
      assert MaxElixirPokeApi.berry("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    test "id not found" do
      assert MaxElixirPokeApi.berry(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.berry(:banana)) == :function_clause
    end
  end

  describe "berry_firmness/1" do
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.berry_firmness("very-soft")
      assert resource["id"] |> is_integer
      assert resource["name"] |> is_bitstring
      assert resource["names"] |> is_list
      assert resource["berries"] |> is_list
    end

    test "name not found" do
      assert MaxElixirPokeApi.berry_firmness("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    test "id not found" do
      assert MaxElixirPokeApi.berry_firmness(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.berry_firmness(:banana)) == :function_clause
    end
  end

  describe "berry_flavor/1" do
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.berry_flavor("spicy")
      assert resource["id"] |> is_integer
      assert resource["name"] |> is_bitstring
      assert resource["names"] |> is_list
      assert resource["berries"] |> is_list
    end

    test "name not found" do
      assert MaxElixirPokeApi.berry_flavor("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    test "id not found" do
      assert MaxElixirPokeApi.berry_flavor(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.berry_flavor(:banana)) == :function_clause
    end
  end

  describe "contest_type/1" do
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.contest_type("cool")
      assert resource["id"] |> is_integer
      assert resource["name"] |> is_bitstring
      assert resource["names"] |> is_list
      assert resource["berry_flavor"] |> is_map
    end

    test "name not found" do
      assert MaxElixirPokeApi.contest_type("banana") == {:error, %{reason: "HTTP Status '404'"}}
    end

    test "id not found" do
      assert MaxElixirPokeApi.contest_type(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.contest_type(:banana)) == :function_clause
    end
  end

  describe "contest_effect/1" do
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.contest_effect(1)
      assert resource["id"] |> is_integer
      assert resource["jam"] |> is_integer
      assert resource["appeal"] |> is_integer
      assert resource["effect_entries"] |> is_list
      assert resource["flavor_text_entries"] |> is_list
    end

    test "id not found" do
      assert MaxElixirPokeApi.contest_effect(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.contest_effect(:banana)) == :function_clause
    end
  end

  describe "super_contest_effect/1" do
    test "success" do
      { :ok, resource } = MaxElixirPokeApi.super_contest_effect(1)
      assert resource["id"] |> is_integer
      assert resource["appeal"] |> is_integer
      assert resource["moves"] |> is_list
      assert resource["flavor_text_entries"] |> is_list
    end

    test "id not found" do
      assert MaxElixirPokeApi.super_contest_effect(9999) == {:error, %{reason: "HTTP Status '404'"}}
    end

    test "datatype invalid [atom]" do
      assert catch_error(MaxElixirPokeApi.super_contest_effect(:banana)) == :function_clause
    end
  end
end
