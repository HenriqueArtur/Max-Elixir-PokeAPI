defmodule MaxElixirPokeApi.Resource do
  @moduledoc """
  The resources functions.
  """

  alias MaxElixirPokeApi.Helper

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
  Return a list of resources.

  Created to be used in `MaxElixirPokeApi.resource/1`.
  """
  @spec resource(api_resource) :: {:ok, map} | {:error, %{reason: String.t()}}
  def resource(name), do: do_resource(name)

  @doc false
  defp do_resource(:berry),                     do: Helper.do_request("berry")
  @doc false
  defp do_resource(:berry_firmness),            do: Helper.do_request("berry-firmness")
  @doc false
  defp do_resource(:berry_flavor),              do: Helper.do_request("berry-flavor")
  @doc false
  defp do_resource(:contest_type),              do: Helper.do_request("contest-type")
  @doc false
  defp do_resource(:contest_effect),            do: Helper.do_request("contest-effect")
  @doc false
  defp do_resource(:super_contest_effect),      do: Helper.do_request("super-contest-effect")
  @doc false
  defp do_resource(:encounter_method),          do: Helper.do_request("encounter-method")
  @doc false
  defp do_resource(:encounter_condition),       do: Helper.do_request("encounter-condition")
  @doc false
  defp do_resource(:encounter_condition_value), do: Helper.do_request("encounter-condition-value")
  @doc false
  defp do_resource(:evolution_chain),           do: Helper.do_request("evolution-chain")
  @doc false
  defp do_resource(:evolution_trigger),         do: Helper.do_request("evolution-trigger")
  @doc false
  defp do_resource(:generation),                do: Helper.do_request("generation")
  @doc false
  defp do_resource(:pokedex),                   do: Helper.do_request("pokedex")
  @doc false
  defp do_resource(:version),                   do: Helper.do_request("version")
  @doc false
  defp do_resource(:version_group),             do: Helper.do_request("version-group")
  @doc false
  defp do_resource(:item),                      do: Helper.do_request("item")
  @doc false
  defp do_resource(:item_attribute),            do: Helper.do_request("item-attribute")
  @doc false
  defp do_resource(:item_category),             do: Helper.do_request("item-category")
  @doc false
  defp do_resource(:item_fling_effect),         do: Helper.do_request("item-fling-effect")
  @doc false
  defp do_resource(:item_pocket),               do: Helper.do_request("item-pocket")
  @doc false
  defp do_resource(:location),                  do: Helper.do_request("location")
  @doc false
  defp do_resource(:location_area),             do: Helper.do_request("location-area")
  @doc false
  defp do_resource(:pal_park_area),             do: Helper.do_request("pal-park-area")
  @doc false
  defp do_resource(:region),                    do: Helper.do_request("region")
  @doc false
  defp do_resource(:machine),                   do: Helper.do_request("machine")
  @doc false
  defp do_resource(:move),                      do: Helper.do_request("move")
  @doc false
  defp do_resource(:move_ailment),              do: Helper.do_request("move-ailment")
  @doc false
  defp do_resource(:move_battle_style),         do: Helper.do_request("move-battle-style")
  @doc false
  defp do_resource(:move_category),             do: Helper.do_request("move-category")
  @doc false
  defp do_resource(:move_damage_class),         do: Helper.do_request("move-damage-class")
  @doc false
  defp do_resource(:move_learn_method),         do: Helper.do_request("move-learn-method")
  @doc false
  defp do_resource(:move_target),               do: Helper.do_request("move-target")
  @doc false
  defp do_resource(:ability),                   do: Helper.do_request("ability")
  @doc false
  defp do_resource(:characteristic),            do: Helper.do_request("characteristic")
  @doc false
  defp do_resource(:egg_group),                 do: Helper.do_request("egg-group")
  @doc false
  defp do_resource(:gender),                    do: Helper.do_request("gender")
  @doc false
  defp do_resource(:growth_rate),               do: Helper.do_request("growth-rate")
  @doc false
  defp do_resource(:nature),                    do: Helper.do_request("nature")
  @doc false
  defp do_resource(:pokeathlon_stat),           do: Helper.do_request("pokeathlon-stat")
  @doc false
  defp do_resource(:pokemon),                   do: Helper.do_request("pokemon")
  @doc false
  defp do_resource(:pokemon_color),             do: Helper.do_request("pokemon-color")
  @doc false
  defp do_resource(:pokemon_form),              do: Helper.do_request("pokemon-form")
  @doc false
  defp do_resource(:pokemon_habitat),           do: Helper.do_request("pokemon-habitat")
  @doc false
  defp do_resource(:pokemon_shape),             do: Helper.do_request("pokemon-shape")
  @doc false
  defp do_resource(:pokemon_species),           do: Helper.do_request("pokemon-species")
  @doc false
  defp do_resource(:stat),                      do: Helper.do_request("stat")
  @doc false
  defp do_resource(:type),                      do: Helper.do_request("type")
  @doc false
  defp do_resource(:language),                  do: Helper.do_request("language")
  @doc false
  defp do_resource(_),                          do: {:error, %{reason: "resource invalid."}}
end
