defmodule MaxElixirPokeApi do
  @moduledoc """
  **WORKING IN PROGRESS**

  MaxElixirPokeApi is a Elixir Structured(?) wrapper for [PokeAPI](https://pokeapi.co/).

  This package has all function explicit in [PokeAPI Doc](https://pokeapi.co/docs/v2).
  """

  alias MaxElixirPokeApi.Berry
  alias MaxElixirPokeApi.Resource

  @typedoc """
  Resources from [PokeAPI](https://pokeapi.co/).
  """
  @type api_resource ::
      :berry
    | :berry_firmness
    | :berry_flavor
    | :contest_type
    | :contest_effect
    | :super_contest_effect
    | :encounter_method
    | :encounter_condition
    | :encounter_condition_value
    | :evolution_chain
    | :evolution_trigger
    | :generation
    | :pokedex
    | :version
    | :version_group
    | :item
    | :item_attribute
    | :item_category
    | :item_fling_effect
    | :item_pocket
    | :location
    | :location_area
    | :pal_park_area
    | :region
    | :machine
    | :move
    | :move_ailment
    | :move_battle_style
    | :move_category
    | :move_damage_class
    | :move_learn_method
    | :move_target
    | :ability
    | :characteristic
    | :egg_group
    | :gender
    | :growth_rate
    | :nature
    | :pokeathlon_stat
    | :pokemon
    | :pokemon_color
    | :pokemon_form
    | :pokemon_habitat
    | :pokemon_shape
    | :pokemon_species
    | :stat
    | :type
    | :language

  @typedoc """
  Identifier as `{id or name}` used in `https://pokeapi.co/api/v2/{resource}/{id or name}/`
  """
  @type id_or_name :: String.t() | integer()

  @doc """
  Return a paginated list of available resources for that API. By default, a list "page" will contain up to 20 resources.

  ## Parameters

    - name: Aton that represents the resource from Poke API.

  ## Examples

      iex> MaxElixirPokeApi.resource(:version)
      {:ok,
        %{
          "count" => 39,
          "next" => "https://pokeapi.co/api/v2/version?offset=20&limit=19",
          "previous" => nil,
          "results" => [
            %{"name" => "red", "url" => "https://pokeapi.co/api/v2/version/1/"},
            %{"name" => "blue", "url" => "https://pokeapi.co/api/v2/version/2/"},
            %{"name" => "yellow", "url" => "https://pokeapi.co/api/v2/version/3/"},
            %{"name" => "gold", "url" => "https://pokeapi.co/api/v2/version/4/"},
            %{"name" => "silver", "url" => "https://pokeapi.co/api/v2/version/5/"},
            %{"name" => "crystal", "url" => "https://pokeapi.co/api/v2/version/6/"},
            %{"name" => "ruby", "url" => "https://pokeapi.co/api/v2/version/7/"},
            %{"name" => "sapphire", "url" => "https://pokeapi.co/api/v2/version/8/"},
            %{"name" => "emerald", "url" => "https://pokeapi.co/api/v2/version/9/"},
            %{"name" => "firered", "url" => "https://pokeapi.co/api/v2/version/10/"},
            %{"name" => "leafgreen", "url" => "https://pokeapi.co/api/v2/version/11/"},
            %{"name" => "diamond", "url" => "https://pokeapi.co/api/v2/version/12/"},
            %{"name" => "pearl", "url" => "https://pokeapi.co/api/v2/version/13/"},
            %{"name" => "platinum", "url" => "https://pokeapi.co/api/v2/version/14/"},
            %{"name" => "heartgold", "url" => "https://pokeapi.co/api/v2/version/15/"},
            %{"name" => "soulsilver", "url" => "https://pokeapi.co/api/v2/version/16/"},
            %{"name" => "black", "url" => "https://pokeapi.co/api/v2/version/17/"},
            %{"name" => "white", "url" => "https://pokeapi.co/api/v2/version/18/"},
            %{"name" => "colosseum", "url" => "https://pokeapi.co/api/v2/version/19/"},
            %{"name" => "xd", "url" => "https://pokeapi.co/api/v2/version/20/"}
          ]
        }}

      iex> MaxElixirPokeApi.resource(:pokemon, 5, 5)
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

      iex> MaxElixirPokeApi.resource(:banana)
      {:error, %{reason: "resource invalid."}}
  """
  @spec resource(api_resource, integer, integer) :: {:ok, map} | {:error, %{reason: String.t()}}
  def resource(name, limit \\ 20, page \\ 0), do: Resource.resource(name, limit, page)

  @doc """
  Return a Berry

  ## Parameters

    - id_or_name: Integer or String that represents the resource identify. `https://pokeapi.co/api/v2/berry/{id or name}/`
  """
  @spec berry(id_or_name) :: {:ok, map} | {:error, %{reason: String.t()}}
  def berry(id_or_name), do: Berry.get(id_or_name)
end
