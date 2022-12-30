defmodule MaxElixirPokeApi.EncounterConditionValue do
  @moduledoc """
  The Encounter Condition Value module.
  """

  @typedoc """
  Identifier as `{id or name}` used in `https://pokeapi.co/api/v2/{resource}/{id or name}/`
  """
  @type id_or_name :: String.t() | integer()

  alias MaxElixirPokeApi.Request

  @doc """
  Return a Encounter Condition Value.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/encounter-condition-value/{id or name}/`

  ## Examples

      iex> MaxElixirPokeApi.EncounterConditionValue.get("swarm-yes")
      {:ok,
        %{
          "condition" => %{
            "name" => "swarm",
            "url" => "https://pokeapi.co/api/v2/encounter-condition/1/"
          },
          "id" => 1,
          "name" => "swarm-yes",
          "names" => [
            %{
              "language" => %{
                "name" => "de",
                "url" => "https://pokeapi.co/api/v2/language/6/"
              },
              "name" => "Während eines Schwarms"
            },
            %{
              "language" => %{
                "name" => "en",
                "url" => "https://pokeapi.co/api/v2/language/9/"
              },
              "name" => "During a swarm"
            }
          ]
        }}

      iex> MaxElixirPokeApi.EncounterConditionValue.get(101)
      {:error, %{reason: "HTTP Status '404'"}}

      iex> MaxElixirPokeApi.EncounterConditionValue.get(:banana)
      {:error, %{reason: "&1 only accepts string or integer."}}
  """
  @spec get(id_or_name) :: {:ok, map} | {:error, %{reason: String.t()}}
  def get(id_or_name) when is_bitstring(id_or_name) or is_integer(id_or_name), do: Request.get("encounter-condition-value", id_or_name)
  def get(_), do: {:error, %{reason: "&1 only accepts string or integer."}}
end
