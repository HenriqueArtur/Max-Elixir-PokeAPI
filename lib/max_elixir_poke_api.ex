defmodule MaxElixirPokeApi do
  @moduledoc """
  **WORKING IN PROGRESS**

  MaxElixirPokeApi is a Elixir Structured(?) wrapper for [PokeAPI](https://pokeapi.co/).

  This package has all function explicit in [PokeAPI Doc](https://pokeapi.co/docs/v2).
  """

  alias MaxElixirPokeApi.Resource
  alias MaxElixirPokeApi.Berry
  alias MaxElixirPokeApi.BerryFirmness
  alias MaxElixirPokeApi.BerryFlavor
  alias MaxElixirPokeApi.ContestType
  alias MaxElixirPokeApi.ContestEffect
  alias MaxElixirPokeApi.SuperContestEffect
  alias MaxElixirPokeApi.EncounterMethod
  alias MaxElixirPokeApi.EncounterCondition
  alias MaxElixirPokeApi.EncounterConditionValue
  alias MaxElixirPokeApi.EvolutionChain
  alias MaxElixirPokeApi.EvolutionTrigger
  alias MaxElixirPokeApi.Generation

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

  Check `MaxElixirPokeApi.Resource` module for examples.

  ## Parameters

    - **name:** `Atom` [`api_resource`] that represents the resource from Poke API.
  """
  @spec resource(api_resource, integer, integer) :: {:ok, map} | {:error, %{reason: String.t()}}
  def resource(name, limit \\ 20, page \\ 0), do: Resource.get(name, limit, page)

  @doc """
  Return a Berry.

  Check `MaxElixirPokeApi.Berry` module for examples.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/berry/{id or name}/`
  """
  @spec berry(id_or_name) :: {:ok, map} | {:error, %{reason: String.t()}}
  def berry(id_or_name), do: Berry.get(id_or_name)

  @doc """
  Return a Berry Firmness.

  Check `MaxElixirPokeApi.BerryFirmness` module for examples.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/berry-firmness/{id or name}/`
  """
  @spec berry_firmness(id_or_name) :: {:ok, map} | {:error, %{reason: String.t()}}
  def berry_firmness(id_or_name), do: BerryFirmness.get(id_or_name)

  @doc """
  Return a Berry Flavor.

  Check `MaxElixirPokeApi.BerryFlavor` module for examples.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/berry-flavor/{id or name}/`
  """
  @spec berry_flavor(id_or_name) :: {:ok, map} | {:error, %{reason: String.t()}}
  def berry_flavor(id_or_name), do: BerryFlavor.get(id_or_name)

  @doc """
  Return a Contest Type.

  Check `MaxElixirPokeApi.ContestType` module for examples.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/contest-type/{id or name}/`
  """
  @spec contest_type(id_or_name) :: {:ok, map} | {:error, %{reason: String.t()}}
  def contest_type(id_or_name), do: ContestType.get(id_or_name)

  @doc """
  Return a Contest Effect.

  Check `MaxElixirPokeApi.ContestEffect` module for examples.

  ## Parameters

    - **id:** `Integer` that represents the resource identify. `https://pokeapi.co/api/v2/contest-effect/{id}/`
  """
  @spec contest_effect(integer) :: {:ok, map} | {:error, %{reason: String.t()}}
  def contest_effect(id), do: ContestEffect.get(id)

  @doc """
  Return a Contest Contest Effect.

  Check `MaxElixirPokeApi.SuperContestEffect` module for examples.

  ## Parameters

    - **id:** `Integer` that represents the resource identify. `https://pokeapi.co/api/v2/super-contest-effect/{id}/`
  """
  @spec super_contest_effect(integer) :: {:ok, map} | {:error, %{reason: String.t()}}
  def super_contest_effect(id), do: SuperContestEffect.get(id)

  @doc """
  Return a Encounter Method.

  Check `MaxElixirPokeApi.EncounterMethod` module for examples.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/encounter-method/{id or name}/`
  """
  @spec encounter_method(id_or_name) :: {:ok, map} | {:error, %{reason: String.t()}}
  def encounter_method(id_or_name), do: EncounterMethod.get(id_or_name)

  @doc """
  Return a Encounter Condition.

  Check `MaxElixirPokeApi.EncounterCondition` module for examples.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/encounter-condition/{id or name}/`
  """
  @spec encounter_condition(id_or_name) :: {:ok, map} | {:error, %{reason: String.t()}}
  def encounter_condition(id_or_name), do: EncounterCondition.get(id_or_name)

  @doc """
  Return a Encounter Condition Value.

  Check `MaxElixirPokeApi.EncounterConditionValue` module for examples.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/encounter-condition-value/{id or name}/`
  """
  @spec encounter_condition_value(id_or_name) :: {:ok, map} | {:error, %{reason: String.t()}}
  def encounter_condition_value(id_or_name), do: EncounterConditionValue.get(id_or_name)

  @doc """
  Return a Evolution Chain.

  Check `MaxElixirPokeApi.EvolutionChain` module for examples.

  ## Parameters

    - **id:** `Integer` that represents the resource identify. `https://pokeapi.co/api/v2/evolution-chain/{id}/`

  """
  @spec evolution_chain(integer) :: {:ok, map} | {:error, %{reason: String.t()}}
  def evolution_chain(id), do: EvolutionChain.get(id)

   @doc """
  Return a Evolution Trigger.

  Check `MaxElixirPokeApi.EvolutionTrigger` module for examples.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/evolution-trigger/{id or name}/`
  """
  @spec evolution_trigger(id_or_name) :: {:ok, map} | {:error, %{reason: String.t()}}
  def evolution_trigger(id_or_name), do: EvolutionTrigger.get(id_or_name)

  @doc """
  Return a Generation.

  Check `MaxElixirPokeApi.Generation` module for examples.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/generation/{id or name}/`
  """
  @spec generation(id_or_name) :: {:ok, map} | {:error, %{reason: String.t()}}
  def generation(id_or_name), do: Generation.get(id_or_name)
end
