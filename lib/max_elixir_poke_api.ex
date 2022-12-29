defmodule MaxElixirPokeApi do
  alias MaxElixirPokeApi.Helper

  def resource(:berry), do: do_request("berry")
  def resource(:berry_firmness), do: do_request("berry-firmness")
  def resource(:berry_flavor), do: do_request("berry-flavor")
  def resource(:contest_type), do: do_request("contest-type")
  def resource(:contest_effect), do: do_request("contest-effect")
  def resource(:super_contest_effect), do: do_request("super-contest-effect")
  def resource(:encounter_method), do: do_request("encounter-method")
  def resource(:encounter_condition), do: do_request("encounter-condition")
  def resource(:encounter_condition_value), do: do_request("encounter-condition-value")
  def resource(:evolution_chain), do: do_request("evolution-chain")
  def resource(:evolution_trigger), do: do_request("evolution-trigger")
  def resource(:generation), do: do_request("generation")
  def resource(:pokedex), do: do_request("pokedex")
  def resource(:version), do: do_request("version")
  def resource(:version_group), do: do_request("version-group")
  def resource(:item), do: do_request("item")
  def resource(:item_attribute), do: do_request("item-attribute")
  def resource(:item_category), do: do_request("item-category")
  def resource(:item_fling_effect), do: do_request("item-fling-effect")
  def resource(:item_pocket), do: do_request("item-pocket")
  def resource(:location), do: do_request("location")
  def resource(:location_area), do: do_request("location-area")
  def resource(:pal_park_area), do: do_request("pal-park-area")
  def resource(:region), do: do_request("region")
  def resource(:machine), do: do_request("machine")
  def resource(:move), do: do_request("move")
  def resource(:move_ailment), do: do_request("move-ailment")
  def resource(:move_battle_style), do: do_request("move-battle-style")
  def resource(:move_category), do: do_request("move-category")
  def resource(:move_damage_class), do: do_request("move-damage-class")
  def resource(:move_learn_method), do: do_request("move-learn-method")
  def resource(:move_target), do: do_request("move-target")
  def resource(:ability), do: do_request("ability")
  def resource(:characteristic), do: do_request("characteristic")
  def resource(:egg_group), do: do_request("egg-group")
  def resource(:gender), do: do_request("gender")
  def resource(:growth_rate), do: do_request("growth-rate")
  def resource(:nature), do: do_request("nature")
  def resource(:pokeathlon_stat), do: do_request("pokeathlon-stat")
  def resource(:pokemon), do: do_request("pokemon")
  # def resource(:pokemon/{id or name}/encounters), do: do_request("pokemon/{id or name}/encounters")
  def resource(:pokemon_color), do: do_request("pokemon-color")
  def resource(:pokemon_form), do: do_request("pokemon-form")
  def resource(:pokemon_habitat), do: do_request("pokemon-habitat")
  def resource(:pokemon_shape), do: do_request("pokemon-shape")
  def resource(:pokemon_species), do: do_request("pokemon-species")
  def resource(:stat), do: do_request("stat")
  def resource(:type), do: do_request("type")
  def resource(:language), do: do_request("language")
  
  def resource(_), do: {:error, %{reason: "resource invalid."}}
  
  defp do_request(resource) do
    resource
    |> Helper.make_url
    |> Helper.client_get
    |> Helper.response
    |> Helper.decode
  end
end
