defmodule MaxElixirPokeApi.VersionGroup do
  @moduledoc """
  The Version Group module.
  """

  @typedoc """
  Identifier as `{id or name}` used in `https://pokeapi.co/api/v2/{resource}/{id or name}/`
  """
  @type id_or_name :: String.t() | integer()

  alias MaxElixirPokeApi.Request

  @doc """
  Return a Version Group.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/version-group/{id or name}/`

  ## Examples

      iex> MaxElixirPokeApi.VersionGroup.get("red-blue")
      {:ok,
        %{
          "generation" => %{
            "name" => "generation-i",
            "url" => "https://pokeapi.co/api/v2/generation/1/"
          },
          "id" => 1,
          "move_learn_methods" => [
            %{
              "name" => "level-up",
              "url" => "https://pokeapi.co/api/v2/move-learn-method/1/"
            },
            %{
              "name" => "machine",
              "url" => "https://pokeapi.co/api/v2/move-learn-method/4/"
            },
            %{
              "name" => "stadium-surfing-pikachu",
              "url" => "https://pokeapi.co/api/v2/move-learn-method/5/"
            }
          ],
          "name" => "red-blue",
          "order" => 1,
          "pokedexes" => [
            %{"name" => "kanto", "url" => "https://pokeapi.co/api/v2/pokedex/2/"}
          ],
          "regions" => [
            %{"name" => "kanto", "url" => "https://pokeapi.co/api/v2/region/1/"}
          ],
          "versions" => [
            %{"name" => "red", "url" => "https://pokeapi.co/api/v2/version/1/"},
            %{"name" => "blue", "url" => "https://pokeapi.co/api/v2/version/2/"}
          ]
        }}

      iex> MaxElixirPokeApi.VersionGroup.get(101)
      {:error, %{reason: "HTTP Status '404'"}}

      iex> MaxElixirPokeApi.VersionGroup.get(:banana)
      {:error, %{reason: "&1 only accepts string or integer."}}
  """
  @spec get(id_or_name) :: {:ok, map} | {:error, %{reason: String.t()}}
  def get(id_or_name) when is_bitstring(id_or_name) or is_integer(id_or_name), do: Request.get("version-group", id_or_name)
  def get(_), do: {:error, %{reason: "&1 only accepts string or integer."}}
end
