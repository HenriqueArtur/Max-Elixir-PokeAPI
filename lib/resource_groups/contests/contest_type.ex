defmodule MaxElixirPokeApi.ContestType do
  @moduledoc """
  The Contest Type module.
  """

  @typedoc """
  Identifier as `{id or name}` used in `https://pokeapi.co/api/v2/{resource}/{id or name}/`
  """
  @type id_or_name :: String.t() | integer()

  alias MaxElixirPokeApi.Request

  @doc """
  Return a Contest Type.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/contest-type/{id or name}/`

  ## Examples

      iex> MaxElixirPokeApi.ContestType.get("cool")
      {:ok,
        %{
          "berry_flavor" => %{
            "name" => "spicy",
            "url" => "https://pokeapi.co/api/v2/berry-flavor/1/"
          },
          "id" => 1,
          "name" => "cool",
          "names" => [
            %{
              "color" => "Rouge",
              "language" => %{
                "name" => "fr",
                "url" => "https://pokeapi.co/api/v2/language/5/"
              },
              "name" => "Sang-froid"
            },
            %{
              "color" => "Red",
              "language" => %{
                "name" => "en",
                "url" => "https://pokeapi.co/api/v2/language/9/"
              },
              "name" => "Cool"
            }
          ]
        }}

      iex> MaxElixirPokeApi.ContestType.get(101)
      {:error, %{reason: "HTTP Status '404'"}}

      iex> MaxElixirPokeApi.ContestType.get(:banana)
      {:error, %{reason: "&1 only accepts string or integer."}}
  """
  @spec get(id_or_name) :: {:ok, map} | {:error, %{reason: String.t()}}
  def get(id_or_name) when is_bitstring(id_or_name) or is_integer(id_or_name), do: Request.get("contest-type", id_or_name)
  def get(_), do: {:error, %{reason: "&1 only accepts string or integer."}}
end
