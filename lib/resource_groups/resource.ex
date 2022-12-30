defmodule MaxElixirPokeApi.Resource do
  @moduledoc """
  The Resource List module.
  """

  alias MaxElixirPokeApi.Request

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

    - **name:** `Atom` [`api_resource`] that represents the resource from Poke API.

  ## Examples

      iex> MaxElixirPokeApi.Resource.get(:version, 20, 0)
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

      iex> MaxElixirPokeApi.Resource.get(:pokemon, 5, 5)
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

      iex> MaxElixirPokeApi.Resource.get(:banana, 20, 0)
      {:error, %{reason: "resource invalid."}}
  """
  @spec get(api_resource, integer, integer) :: {:ok, map} | {:error, %{reason: String.t()}}
  def get(name, limit, page), do: do_get(name, limit, page)

  @doc false
  defp do_get(:berry, limit, page),                     do: Request.get("berry", limit, page)
  @doc false
  defp do_get(:berry_firmness, limit, page),            do: Request.get("berry-firmness", limit, page)
  @doc false
  defp do_get(:berry_flavor, limit, page),              do: Request.get("berry-flavor", limit, page)
  @doc false
  defp do_get(:contest_type, limit, page),              do: Request.get("contest-type", limit, page)
  @doc false
  defp do_get(:contest_effect, limit, page),            do: Request.get("contest-effect", limit, page)
  @doc false
  defp do_get(:super_contest_effect, limit, page),      do: Request.get("super-contest-effect", limit, page)
  @doc false
  defp do_get(:encounter_method, limit, page),          do: Request.get("encounter-method", limit, page)
  @doc false
  defp do_get(:encounter_condition, limit, page),       do: Request.get("encounter-condition", limit, page)
  @doc false
  defp do_get(:encounter_condition_value, limit, page), do: Request.get("encounter-condition-value", limit, page)
  @doc false
  defp do_get(:evolution_chain, limit, page),           do: Request.get("evolution-chain", limit, page)
  @doc false
  defp do_get(:evolution_trigger, limit, page),         do: Request.get("evolution-trigger", limit, page)
  @doc false
  defp do_get(:generation, limit, page),                do: Request.get("generation", limit, page)
  @doc false
  defp do_get(:pokedex, limit, page),                   do: Request.get("pokedex", limit, page)
  @doc false
  defp do_get(:version, limit, page),                   do: Request.get("version", limit, page)
  @doc false
  defp do_get(:version_group, limit, page),             do: Request.get("version-group", limit, page)
  @doc false
  defp do_get(:item, limit, page),                      do: Request.get("item", limit, page)
  @doc false
  defp do_get(:item_attribute, limit, page),            do: Request.get("item-attribute", limit, page)
  @doc false
  defp do_get(:item_category, limit, page),             do: Request.get("item-category", limit, page)
  @doc false
  defp do_get(:item_fling_effect, limit, page),         do: Request.get("item-fling-effect", limit, page)
  @doc false
  defp do_get(:item_pocket, limit, page),               do: Request.get("item-pocket", limit, page)
  @doc false
  defp do_get(:location, limit, page),                  do: Request.get("location", limit, page)
  @doc false
  defp do_get(:location_area, limit, page),             do: Request.get("location-area", limit, page)
  @doc false
  defp do_get(:pal_park_area, limit, page),             do: Request.get("pal-park-area", limit, page)
  @doc false
  defp do_get(:region, limit, page),                    do: Request.get("region", limit, page)
  @doc false
  defp do_get(:machine, limit, page),                   do: Request.get("machine", limit, page)
  @doc false
  defp do_get(:move, limit, page),                      do: Request.get("move", limit, page)
  @doc false
  defp do_get(:move_ailment, limit, page),              do: Request.get("move-ailment", limit, page)
  @doc false
  defp do_get(:move_battle_style, limit, page),         do: Request.get("move-battle-style", limit, page)
  @doc false
  defp do_get(:move_category, limit, page),             do: Request.get("move-category", limit, page)
  @doc false
  defp do_get(:move_damage_class, limit, page),         do: Request.get("move-damage-class", limit, page)
  @doc false
  defp do_get(:move_learn_method, limit, page),         do: Request.get("move-learn-method", limit, page)
  @doc false
  defp do_get(:move_target, limit, page),               do: Request.get("move-target", limit, page)
  @doc false
  defp do_get(:ability, limit, page),                   do: Request.get("ability", limit, page)
  @doc false
  defp do_get(:characteristic, limit, page),            do: Request.get("characteristic", limit, page)
  @doc false
  defp do_get(:egg_group, limit, page),                 do: Request.get("egg-group", limit, page)
  @doc false
  defp do_get(:gender, limit, page),                    do: Request.get("gender", limit, page)
  @doc false
  defp do_get(:growth_rate, limit, page),               do: Request.get("growth-rate", limit, page)
  @doc false
  defp do_get(:nature, limit, page),                    do: Request.get("nature", limit, page)
  @doc false
  defp do_get(:pokeathlon_stat, limit, page),           do: Request.get("pokeathlon-stat", limit, page)
  @doc false
  defp do_get(:pokemon, limit, page),                   do: Request.get("pokemon", limit, page)
  @doc false
  defp do_get(:pokemon_color, limit, page),             do: Request.get("pokemon-color", limit, page)
  @doc false
  defp do_get(:pokemon_form, limit, page),              do: Request.get("pokemon-form", limit, page)
  @doc false
  defp do_get(:pokemon_habitat, limit, page),           do: Request.get("pokemon-habitat", limit, page)
  @doc false
  defp do_get(:pokemon_shape, limit, page),             do: Request.get("pokemon-shape", limit, page)
  @doc false
  defp do_get(:pokemon_species, limit, page),           do: Request.get("pokemon-species", limit, page)
  @doc false
  defp do_get(:stat, limit, page),                      do: Request.get("stat", limit, page)
  @doc false
  defp do_get(:type, limit, page),                      do: Request.get("type", limit, page)
  @doc false
  defp do_get(:language, limit, page),                  do: Request.get("language", limit, page)
  @doc false
  defp do_get(_, _limit, _page),                        do: {:error, %{reason: "resource invalid."}}
end
