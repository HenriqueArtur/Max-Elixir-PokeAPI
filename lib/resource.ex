defmodule MaxElixirPokeApi.Resource do
  @moduledoc """
  The resources functions.
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
  Return a list of resources.

  Created to be used in `MaxElixirPokeApi.resource/1`.
  """
  @spec resource(api_resource) :: {:ok, map} | {:error, %{reason: String.t()}}
  def resource(name), do: do_resource(name)

  @doc false
  defp do_resource(:berry),                     do: Request.get("berry")
  @doc false
  defp do_resource(:berry_firmness),            do: Request.get("berry-firmness")
  @doc false
  defp do_resource(:berry_flavor),              do: Request.get("berry-flavor")
  @doc false
  defp do_resource(:contest_type),              do: Request.get("contest-type")
  @doc false
  defp do_resource(:contest_effect),            do: Request.get("contest-effect")
  @doc false
  defp do_resource(:super_contest_effect),      do: Request.get("super-contest-effect")
  @doc false
  defp do_resource(:encounter_method),          do: Request.get("encounter-method")
  @doc false
  defp do_resource(:encounter_condition),       do: Request.get("encounter-condition")
  @doc false
  defp do_resource(:encounter_condition_value), do: Request.get("encounter-condition-value")
  @doc false
  defp do_resource(:evolution_chain),           do: Request.get("evolution-chain")
  @doc false
  defp do_resource(:evolution_trigger),         do: Request.get("evolution-trigger")
  @doc false
  defp do_resource(:generation),                do: Request.get("generation")
  @doc false
  defp do_resource(:pokedex),                   do: Request.get("pokedex")
  @doc false
  defp do_resource(:version),                   do: Request.get("version")
  @doc false
  defp do_resource(:version_group),             do: Request.get("version-group")
  @doc false
  defp do_resource(:item),                      do: Request.get("item")
  @doc false
  defp do_resource(:item_attribute),            do: Request.get("item-attribute")
  @doc false
  defp do_resource(:item_category),             do: Request.get("item-category")
  @doc false
  defp do_resource(:item_fling_effect),         do: Request.get("item-fling-effect")
  @doc false
  defp do_resource(:item_pocket),               do: Request.get("item-pocket")
  @doc false
  defp do_resource(:location),                  do: Request.get("location")
  @doc false
  defp do_resource(:location_area),             do: Request.get("location-area")
  @doc false
  defp do_resource(:pal_park_area),             do: Request.get("pal-park-area")
  @doc false
  defp do_resource(:region),                    do: Request.get("region")
  @doc false
  defp do_resource(:machine),                   do: Request.get("machine")
  @doc false
  defp do_resource(:move),                      do: Request.get("move")
  @doc false
  defp do_resource(:move_ailment),              do: Request.get("move-ailment")
  @doc false
  defp do_resource(:move_battle_style),         do: Request.get("move-battle-style")
  @doc false
  defp do_resource(:move_category),             do: Request.get("move-category")
  @doc false
  defp do_resource(:move_damage_class),         do: Request.get("move-damage-class")
  @doc false
  defp do_resource(:move_learn_method),         do: Request.get("move-learn-method")
  @doc false
  defp do_resource(:move_target),               do: Request.get("move-target")
  @doc false
  defp do_resource(:ability),                   do: Request.get("ability")
  @doc false
  defp do_resource(:characteristic),            do: Request.get("characteristic")
  @doc false
  defp do_resource(:egg_group),                 do: Request.get("egg-group")
  @doc false
  defp do_resource(:gender),                    do: Request.get("gender")
  @doc false
  defp do_resource(:growth_rate),               do: Request.get("growth-rate")
  @doc false
  defp do_resource(:nature),                    do: Request.get("nature")
  @doc false
  defp do_resource(:pokeathlon_stat),           do: Request.get("pokeathlon-stat")
  @doc false
  defp do_resource(:pokemon),                   do: Request.get("pokemon")
  @doc false
  defp do_resource(:pokemon_color),             do: Request.get("pokemon-color")
  @doc false
  defp do_resource(:pokemon_form),              do: Request.get("pokemon-form")
  @doc false
  defp do_resource(:pokemon_habitat),           do: Request.get("pokemon-habitat")
  @doc false
  defp do_resource(:pokemon_shape),             do: Request.get("pokemon-shape")
  @doc false
  defp do_resource(:pokemon_species),           do: Request.get("pokemon-species")
  @doc false
  defp do_resource(:stat),                      do: Request.get("stat")
  @doc false
  defp do_resource(:type),                      do: Request.get("type")
  @doc false
  defp do_resource(:language),                  do: Request.get("language")
  @doc false
  defp do_resource(_),                          do: {:error, %{reason: "resource invalid."}}
end
