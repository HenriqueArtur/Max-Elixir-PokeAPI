defmodule MaxElixirPokeApi.Behaviour do
  @moduledoc """
  Main Behaviour
  """

  @typedoc """
  Identifier as `{id or name}` used in `https://pokeapi.co/api/v2/{resource}/{id or name}/`
  """
  @type id_or_name :: String.t() | integer()
  @typedoc """
  Response from lib functions
  """
  @type response :: {:ok, map} | {:error, %{reason: String.t()}}

  @callback resource(atom, integer, integer) :: response
  @callback berry(id_or_name) :: response
  @callback berry_firmness(id_or_name) :: response
  @callback berry_flavor(id_or_name) :: response
  @callback contest_type(id_or_name) :: response
  @callback contest_effect(integer) :: response
  @callback super_contest_effect(integer) :: response
  @callback encounter_method(id_or_name) :: response
  @callback encounter_condition(id_or_name) :: response
  @callback encounter_condition_value(id_or_name) :: response
  @callback evolution_chain(integer) :: response
  @callback evolution_trigger(id_or_name) :: response
  @callback generation(id_or_name) :: response
  @callback pokedex(id_or_name) :: response
  @callback version(id_or_name) :: response
  @callback version_group(id_or_name) :: response
  @callback item(id_or_name) :: response
  @callback item_attribute(id_or_name) :: response
  @callback item_category(id_or_name) :: response
  @callback item_fling_effect(id_or_name) :: response
  @callback item_pocket(id_or_name) :: response
end
