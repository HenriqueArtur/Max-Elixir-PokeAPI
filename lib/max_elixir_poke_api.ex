defmodule MaxElixirPokeApi do
  @moduledoc """
  **WORKING IN PROGRESS**

  MaxElixirPokeApi is a Elixir Structured(?) wrapper for [PokeAPI](https://pokeapi.co/).

  This package has all function explicit in [PokeAPI Doc](https://pokeapi.co/docs/v2).
  """

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

      iex> MaxElixirPokeApi.resource(:banana)
      {:error, %{reason: "resource invalid."}}
  """
  @spec resource(api_resource) :: {:ok, map} | {:error, %{reason: String.t()}}
  def resource(name), do: Resource.resource(name)
end
