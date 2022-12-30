defmodule MaxElixirPokeApi.EncounterCondition do
  @moduledoc """
  The Encounter Condition module.
  """

  @typedoc """
  Identifier as `{id or name}` used in `https://pokeapi.co/api/v2/{resource}/{id or name}/`
  """
  @type id_or_name :: String.t() | integer()

  alias MaxElixirPokeApi.Request

  @doc """
  Return a Encounter Condition.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/encounter-condition/{id or name}/`

  ## Examples

      iex> MaxElixirPokeApi.EncounterCondition.get("swarm")
      {:ok,
        %{
          "id" => 1,
          "name" => "swarm",
          "names" => [
            %{
              "language" => %{
                "name" => "fr",
                "url" => "https://pokeapi.co/api/v2/language/5/"
              },
              "name" => "Essaim"
            },
            %{
              "language" => %{
                "name" => "de",
                "url" => "https://pokeapi.co/api/v2/language/6/"
              },
              "name" => "Schwarm"
            },
            %{
              "language" => %{
                "name" => "en",
                "url" => "https://pokeapi.co/api/v2/language/9/"
              },
              "name" => "Swarm"
            }
          ],
          "values" => [
            %{
              "name" => "swarm-yes",
              "url" => "https://pokeapi.co/api/v2/encounter-condition-value/1/"
            },
            %{
              "name" => "swarm-no",
              "url" => "https://pokeapi.co/api/v2/encounter-condition-value/2/"
            }
          ]
        }}

      iex> MaxElixirPokeApi.EncounterCondition.get(101)
      {:error, %{reason: "HTTP Status '404'"}}

      iex> MaxElixirPokeApi.EncounterCondition.get(:banana)
      {:error, %{reason: "&1 only accepts string or integer."}}
  """
  @spec get(id_or_name) :: {:ok, map} | {:error, %{reason: String.t()}}
  def get(id_or_name) when is_bitstring(id_or_name) or is_integer(id_or_name), do: Request.get("encounter-condition", id_or_name)
  def get(_), do: {:error, %{reason: "&1 only accepts string or integer."}}
end
