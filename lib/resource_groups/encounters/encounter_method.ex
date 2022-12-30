defmodule MaxElixirPokeApi.EncounterMethod do
  @moduledoc """
  The Encounter Method module.
  """

  @typedoc """
  Identifier as `{id or name}` used in `https://pokeapi.co/api/v2/{resource}/{id or name}/`
  """
  @type id_or_name :: String.t() | integer()

  alias MaxElixirPokeApi.Request

  @doc """
  Return a Encounter Method.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/encounter-method/{id or name}/`

  ## Examples

      iex> MaxElixirPokeApi.EncounterMethod.get("walk")
      {:ok,
        %{
          "id" => 1,
          "name" => "walk",
          "names" => [
            %{
              "language" => %{
                "name" => "de",
                "url" => "https://pokeapi.co/api/v2/language/6/"
              },
              "name" => "Im hohen Gras oder in einer Höhle laufen"
            },
            %{
              "language" => %{
                "name" => "en",
                "url" => "https://pokeapi.co/api/v2/language/9/"
              },
              "name" => "Walking in tall grass or a cave"
            }
          ],
          "order" => 1
        }}

      iex> MaxElixirPokeApi.EncounterMethod.get(101)
      {:error, %{reason: "HTTP Status '404'"}}

      iex> MaxElixirPokeApi.EncounterMethod.get(:banana)
      {:error, %{reason: "&1 only accepts string or integer."}}
  """
  @spec get(id_or_name) :: {:ok, map} | {:error, %{reason: String.t()}}
  def get(id_or_name) when is_bitstring(id_or_name) or is_integer(id_or_name), do: Request.get("encounter-method", id_or_name)
  def get(_), do: {:error, %{reason: "&1 only accepts string or integer."}}
end
