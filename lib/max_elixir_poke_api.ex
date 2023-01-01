defmodule MaxElixirPokeApi do
  @moduledoc """
  **WORKING IN PROGRESS**

  MaxElixirPokeApi is a Elixir Structured(?) wrapper for [PokeAPI](https://pokeapi.co/).

  This package has all function explicit in [PokeAPI Doc](https://pokeapi.co/docs/v2).
  """

  @behaviour MaxElixirPokeApi.Behaviour

  alias MaxElixirPokeApi.{
    Behaviour,
    Request
  }

  @type id_or_name :: Behaviour.id_or_name
  @type response :: Behaviour.response

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
    item_fling_effect: "item-fling-effect",
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

  @doc """
  Return a paginated list of available resources for that API. By default, a list "page" will contain up to 20 resources.

  ## Parameters

    - **name:** `Atom` [`@resources_list`] that represents the resource from Poke API.
  """
  @impl Behaviour
  def resource(name, limit \\ 20, page \\ 0)
    when is_atom(name) ,
    do: Request.get(@resources_list[name], limit, page)

  @doc """
  Return a Berry.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/berry/{id or name}/`
  """
  @impl Behaviour
  def berry(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: Request.get(@resources_list[:berry], id_or_name)

  @doc """
  Return a Berry Firmness.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/berry-firmness/{id or name}/`
  """
  @impl Behaviour
  def berry_firmness(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: Request.get(@resources_list[:berry_firmness], id_or_name)

  @doc """
  Return a Berry Flavor.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/berry-flavor/{id or name}/`
  """
  @impl Behaviour
  def berry_flavor(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: Request.get(@resources_list[:berry_flavor], id_or_name)

  @doc """
  Return a Contest Type.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/contest-type/{id or name}/`
  """
  @impl Behaviour
  def contest_type(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: Request.get(@resources_list[:contest_type], id_or_name)

  @doc """
  Return a Contest Effect.

  ## Parameters

    - **id:** `Integer` that represents the resource identify. `https://pokeapi.co/api/v2/contest-effect/{id}/`
  """
  @impl Behaviour
  def contest_effect(id)
    when is_integer(id),
    do: Request.get(@resources_list[:contest_effect], id)

  @doc """
  Return a Contest Contest Effect.

  ## Parameters

    - **id:** `Integer` that represents the resource identify. `https://pokeapi.co/api/v2/super-contest-effect/{id}/`
  """
  @impl Behaviour
  def super_contest_effect(id)
    when is_integer(id),
    do: Request.get(@resources_list[:super_contest_effect], id)

  @doc """
  Return a Encounter Method.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/encounter-method/{id or name}/`
  """
  @impl Behaviour
  def encounter_method(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: Request.get(@resources_list[:encounter_method], id_or_name)

  @doc """
  Return a Encounter Condition.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/encounter-condition/{id or name}/`
  """
  @impl Behaviour
  def encounter_condition(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: Request.get(@resources_list[:encounter_condition], id_or_name)

  @doc """
  Return a Encounter Condition Value.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/encounter-condition-value/{id or name}/`
  """
  @impl Behaviour
  def encounter_condition_value(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: Request.get(@resources_list[:encounter_condition_value], id_or_name)

  @doc """
  Return a Evolution Chain.

  ## Parameters

    - **id:** `Integer` that represents the resource identify. `https://pokeapi.co/api/v2/evolution-chain/{id}/`
  """
  @impl Behaviour
  def evolution_chain(id)
    when is_integer(id),
    do: Request.get(@resources_list[:evolution_chain], id)

  @doc """
  Return a Evolution Trigger.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/evolution-trigger/{id or name}/`
  """
  @impl Behaviour
  def evolution_trigger(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: Request.get(@resources_list[:evolution_trigger], id_or_name)

  @doc """
  Return a Generation.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/generation/{id or name}/`
  """
  @impl Behaviour
  def generation(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: Request.get(@resources_list[:generation], id_or_name)

  @doc """
  Return a Pokedex.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/pokedex/{id or name}/`
  """
  @impl Behaviour
  def pokedex(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: Request.get(@resources_list[:pokedex], id_or_name)

  @doc """
  Return a Version.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/version/{id or name}/`
  """
  @impl Behaviour
  def version(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: Request.get(@resources_list[:version], id_or_name)

  @doc """
  Return a Version Group.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/version-group/{id or name}/`
  """
  @impl Behaviour
  def version_group(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: Request.get(@resources_list[:version_group], id_or_name)

  @doc """
  Return a Item.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/item/{id or name}/`
  """
  @impl Behaviour
  def item(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: Request.get(@resources_list[:item], id_or_name)

  @doc """
  Return a Item Attribute.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/item-attribute/{id or name}/`
  """
  @impl Behaviour
  def item_attribute(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: Request.get(@resources_list[:item_attribute], id_or_name)

  @doc """
  Return a Item Category.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/item-category/{id or name}/`
  """
  @impl Behaviour
  def item_category(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: Request.get(@resources_list[:item_category], id_or_name)

  @doc """
  Return a Item Fling Effect.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/item-fling-effect/{id or name}/`
  """
  @impl Behaviour
  def item_fling_effect(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: Request.get(@resources_list[:item_fling_effect], id_or_name)

  @doc """
  Return a Item Pocket.

  ## Parameters
    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/item-pocket/{id or name}/`
  """
  @impl Behaviour
  def item_pocket(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: Request.get(@resources_list[:item_pocket], id_or_name)

  @doc """
  Locations that can be visited within the games. Locations make up sizable portions of regions, like cities or routes.

  ## Parameters
    - **id_or_name:** `Integer` or `String` that represents the resource identify.
  """
  @impl Behaviour
  def location(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: Request.get(@resources_list[:location], id_or_name)

  @doc """
  Location areas are sections of areas, such as floors in a building or cave. Each area has its own set of possible Pokémon encounters.

  ## Parameters
    - **id_or_name:** `t:id_or_name/0`
  """
  @impl Behaviour
  def location_area(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: Request.get(@resources_list[:location_area], id_or_name)

  @doc """
  Areas used for grouping Pokémon encounters in Pal Park. They're like habitats that are specific to [Pal Park](https://bulbapedia.bulbagarden.net/wiki/Pal_Park).

  ## Parameters
    - **id_or_name:** `t:id_or_name/0`
  """
  @impl Behaviour
  def pal_park_area(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: Request.get(@resources_list[:pal_park_area], id_or_name)

  @doc """
  A region is an organized area of the Pokémon world. Most often, the main difference between regions is the species of Pokémon that can be encountered within them.

  ## Parameters
    - **id_or_name:** `t:id_or_name/0`
  """
  @impl Behaviour
  def region(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: Request.get(@resources_list[:region], id_or_name)

  @doc """
  Machines are the representation of items that teach moves to Pokémon. They vary from version to version, so it is not certain that one specific TM or HM corresponds to a single Machine.

  ## Parameters

    - **id:** `Integer` that represents the resource identify.
  """
  @impl Behaviour
  def machine(id)
    when is_integer(id),
    do: Request.get(@resources_list[:machine], id)
end
