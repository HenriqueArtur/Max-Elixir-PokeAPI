defmodule MaxElixirPokeApi.EvolutionChain do
  @moduledoc """
  The Evolution Chain module.
  """

  alias MaxElixirPokeApi.Request

  @doc """
  Return a Evolution Chain.

  ## Parameters

    - **id:** `Integer` that represents the resource identify. `https://pokeapi.co/api/v2/evolution-chain/{id}/`

  ## Examples

      iex> MaxElixirPokeApi.EvolutionChain.get(1)
      {:ok,
        %{
          "baby_trigger_item" => nil,
          "chain" => %{
            "evolution_details" => [],
            "evolves_to" => [
              %{
                "evolution_details" => [
                  %{
                    "gender" => nil,
                    "held_item" => nil,
                    "item" => nil,
                    "known_move" => nil,
                    "known_move_type" => nil,
                    "location" => nil,
                    "min_affection" => nil,
                    "min_beauty" => nil,
                    "min_happiness" => nil,
                    "min_level" => 16,
                    "needs_overworld_rain" => false,
                    "party_species" => nil,
                    "party_type" => nil,
                    "relative_physical_stats" => nil,
                    "time_of_day" => "",
                    "trade_species" => nil,
                    "trigger" => %{
                      "name" => "level-up",
                      "url" => "https://pokeapi.co/api/v2/evolution-trigger/1/"
                    },
                    "turn_upside_down" => false
                  }
                ],
                "evolves_to" => [
                  %{
                    "evolution_details" => [
                      %{
                        "gender" => nil,
                        "held_item" => nil,
                        "item" => nil,
                        "known_move" => nil,
                        "known_move_type" => nil,
                        "location" => nil,
                        "min_affection" => nil,
                        "min_beauty" => nil,
                        "min_happiness" => nil,
                        "min_level" => 32,
                        "needs_overworld_rain" => false,
                        "party_species" => nil,
                        "party_type" => nil,
                        "relative_physical_stats" => nil,
                        "time_of_day" => "",
                        "trade_species" => nil,
                        "trigger" => %{
                          "name" => "level-up",
                          "url" => "https://pokeapi.co/api/v2/evolution-trigger/1/"
                        },
                        "turn_upside_down" => false
                      }
                    ],
                    "evolves_to" => [],
                    "is_baby" => false,
                    "species" => %{
                      "name" => "venusaur",
                      "url" => "https://pokeapi.co/api/v2/pokemon-species/3/"
                    }
                  }
                ],
                "is_baby" => false,
                "species" => %{
                  "name" => "ivysaur",
                  "url" => "https://pokeapi.co/api/v2/pokemon-species/2/"
                }
              }
            ],
            "is_baby" => false,
            "species" => %{
              "name" => "bulbasaur",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/1/"
            }
          },
          "id" => 1
        }}

      iex> MaxElixirPokeApi.EvolutionChain.get("banana")
      {:error, %{reason: "&1 only accepts integer."}}

      iex> MaxElixirPokeApi.EvolutionChain.get(:banana)
      {:error, %{reason: "&1 only accepts integer."}}
  """
  @spec get(integer) :: {:ok, map} | {:error, %{reason: String.t()}}
  def get(id) when is_integer(id), do: Request.get("evolution-chain", id)
  def get(_), do: {:error, %{reason: "&1 only accepts integer."}}
end
