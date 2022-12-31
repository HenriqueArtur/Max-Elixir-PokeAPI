defmodule MaxElixirPokeApi do
  @moduledoc """
  **WORKING IN PROGRESS**

  MaxElixirPokeApi is a Elixir Structured(?) wrapper for [PokeAPI](https://pokeapi.co/).

  This package has all function explicit in [PokeAPI Doc](https://pokeapi.co/docs/v2).
  """

  alias MaxElixirPokeApi.Request

  @type response :: {:ok, map} | {:error, %{reason: String.t()}}

  @resources_list %{
    berry: "berry",
    berry_firmness: "berry-firmness",
    berry_flavor: "berry-flavor",
    contest_type: "contest-type",
    contest_effect: "contest-effect",
    super_contest_effect: "super-contest-effect",
    encounter_method: "encounter-method",
    encounter_condition: "encounter-condition",
    encounter_condition_value: "encounter-condition-value",
    evolution_chain: "evolution-chain",
    evolution_trigger: "evolution-trigger",
    generation: "generation",
    pokedex: "pokedex",
    version: "version",
    version_group: "version-group",
    item: "item",
    item_attribute: "item-attribute",
    item_category: "item-category",
    item_fling_effect: "item_fling-effect",
    item_pocket: "item-pocket",
    location: "location",
    location_area: "location-area",
    pal_park_area: "pal-park-area",
    region: "region",
    machine: "machine",
    move: "move",
    move_ailment: "move-ailment",
    move_battle_style: "move-battle-style",
    move_category: "move-category",
    move_damage_class: "move-damage-class",
    move_learn_method: "move-learn-method",
    move_target: "move-target",
    ability: "ability",
    characteristic: "characteristic",
    egg_group: "egg-group",
    gender: "gender",
    growth_rate: "growth-rate",
    nature: "nature",
    pokeathlon_stat: "pokeathlon-stat",
    pokemon: "pokemon",
    pokemon_color: "pokemon-color",
    pokemon_form: "pokemon-form",
    pokemon_habitat: "pokemon-habitat",
    pokemon_shape: "pokemon-shape",
    pokemon_species: "pokemon-species",
    stat: "stat",
    type: "type",
    language: "language",
  }

  @typedoc """
  Identifier as `{id or name}` used in `https://pokeapi.co/api/v2/{resource}/{id or name}/`
  """
  @type id_or_name :: String.t() | integer()

  @doc """
  Return a paginated list of available resources for that API. By default, a list "page" will contain up to 20 resources.

  ## Parameters

    - **name:** `Atom` [`api_resource`] that represents the resource from Poke API.
  """
  @spec resource(atom, integer, integer) :: response
  def resource(name, limit \\ 20, page \\ 0), do: Request.get(@resources_list[name], limit, page)

  @doc """
  Return a Berry.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/berry/{id or name}/`
  """
  @spec berry(id_or_name) :: response
  def berry(id_or_name), do: Request.get(@resources_list[:berry], id_or_name)

  @doc """
  Return a Berry Firmness.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/berry-firmness/{id or name}/`
  """
  @spec berry_firmness(id_or_name) :: response
  def berry_firmness(id_or_name), do: Request.get(@resources_list[:berry_firmness], id_or_name)

  @doc """
  Return a Berry Flavor.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/berry-flavor/{id or name}/`
  """
  @spec berry_flavor(id_or_name) :: response
  def berry_flavor(id_or_name), do: Request.get(@resources_list[:berry_flavor], id_or_name)

  @doc """
  Return a Contest Type.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/contest-type/{id or name}/`
  """
  @spec contest_type(id_or_name) :: response
  def contest_type(id_or_name), do: Request.get(@resources_list[:contest_type], id_or_name)

  @doc """
  Return a Contest Effect.

  ## Parameters

    - **id:** `Integer` that represents the resource identify. `https://pokeapi.co/api/v2/contest-effect/{id}/`
  """
  @spec contest_effect(integer) :: response
  def contest_effect(id) when is_integer(id), do: Request.get(@resources_list[:contest_effect], id)

  @doc """
  Return a Contest Contest Effect.

  ## Parameters

    - **id:** `Integer` that represents the resource identify. `https://pokeapi.co/api/v2/super-contest-effect/{id}/`
  """
  @spec super_contest_effect(integer) :: response
  def super_contest_effect(id) when is_integer(id), do: Request.get(@resources_list[:super_contest_effect], id)

  @doc """
  Return a Encounter Method.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/encounter-method/{id or name}/`
  """
  @spec encounter_method(id_or_name) :: response
  def encounter_method(id_or_name), do: Request.get(@resources_list[:encounter_method], id_or_name)

  @doc """
  Return a Encounter Condition.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/encounter-condition/{id or name}/`
  """
  @spec encounter_condition(id_or_name) :: response
  def encounter_condition(id_or_name), do: Request.get(@resources_list[:encounter_condition], id_or_name)

  @doc """
  Return a Encounter Condition Value.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/encounter-condition-value/{id or name}/`
  """
  @spec encounter_condition_value(id_or_name) :: response
  def encounter_condition_value(id_or_name), do: Request.get(@resources_list[:encounter_condition_value], id_or_name)

  @doc """
  Return a Evolution Chain.

  ## Parameters

    - **id:** `Integer` that represents the resource identify. `https://pokeapi.co/api/v2/evolution-chain/{id}/`
  """
  @spec evolution_chain(integer) :: response
  def evolution_chain(id) when is_integer(id), do: Request.get(@resources_list[:evolution_chain], id)

   @doc """
  Return a Evolution Trigger.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/evolution-trigger/{id or name}/`
  """
  @spec evolution_trigger(id_or_name) :: response
  def evolution_trigger(id_or_name), do: Request.get(@resources_list[:evolution_trigger], id_or_name)

  @doc """
  Return a Generation.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/generation/{id or name}/`
  """
  @spec generation(id_or_name) :: response
  def generation(id_or_name), do: Request.get(@resources_list[:generation], id_or_name)

  @doc """
  Return a Pokedex.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/pokedex/{id or name}/`
  """
  @spec pokedex(id_or_name) :: response
  def pokedex(id_or_name), do: Request.get(@resources_list[:pokedex], id_or_name)

  @doc """
  Return a Version.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/version/{id or name}/`
  """
  @spec version(id_or_name) :: response
  def version(id_or_name), do: Request.get(@resources_list[:version], id_or_name)

  @doc """
  Return a Version Group.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/version-group/{id or name}/`
  """
  @spec version_group(id_or_name) :: response
  def version_group(id_or_name), do: Request.get(@resources_list[:version_group], id_or_name)

  @doc """
  Return a Item.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/item/{id or name}/`
  """
  @spec item(id_or_name) :: response
  def item(id_or_name), do: Request.get(@resources_list[:item], id_or_name)

  @doc """
  Return a Item Attribute.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/item-attribute/{id or name}/`
  """
  @spec item_attribute(id_or_name) :: response
  def item_attribute(id_or_name), do: Request.get(@resources_list[:item_attribute], id_or_name)

  @doc """
  Return a Item Category.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/item-category/{id or name}/`
  """
  @spec item_category(id_or_name) :: response
  def item_category(id_or_name), do: Request.get(@resources_list[:item_category], id_or_name)

  @doc """
  Return a Item Fling Effect.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/item-fling-effect/{id or name}/`
  """
  @spec item_fling_effect(id_or_name) :: response
  def item_fling_effect(id_or_name), do: Request.get(@resources_list[:item_fling_effect], id_or_name)

  @doc """
  Return a Item Pocket.
  ## Parameters
    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/item-pocket/{id or name}/`
  """
  @spec item_pocket(id_or_name) :: response
  def item_pocket(id_or_name), do: Request.get(@resources_list[:item_pocket], id_or_name)
end
