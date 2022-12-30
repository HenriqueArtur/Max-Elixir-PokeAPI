defmodule MaxElixirPokeApi.ItemCategory do
  @moduledoc """
  The Item Category module.
  """

  @typedoc """
  Identifier as `{id or name}` used in `https://pokeapi.co/api/v2/{resource}/{id or name}/`
  """
  @type id_or_name :: String.t() | integer()

  alias MaxElixirPokeApi.Request

  @doc """
  Return a Item Category.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/item-category/{id or name}/`

  ## Examples

      iex> MaxElixirPokeApi.ItemCategory.get("stat-boosts")
      {:ok,
        %{
          "id" => 1,
          "items" => [
            %{"name" => "guard-spec", "url" => "https://pokeapi.co/api/v2/item/55/"},
            %{"name" => "dire-hit", "url" => "https://pokeapi.co/api/v2/item/56/"},
            %{"name" => "x-attack", "url" => "https://pokeapi.co/api/v2/item/57/"},
            %{"name" => "x-defense", "url" => "https://pokeapi.co/api/v2/item/58/"},
            %{"name" => "x-speed", "url" => "https://pokeapi.co/api/v2/item/59/"},
            %{"name" => "x-accuracy", "url" => "https://pokeapi.co/api/v2/item/60/"},
            %{"name" => "x-sp-atk", "url" => "https://pokeapi.co/api/v2/item/61/"},
            %{"name" => "x-sp-def", "url" => "https://pokeapi.co/api/v2/item/62/"},
            %{
              "name" => "max-mushrooms",
              "url" => "https://pokeapi.co/api/v2/item/1631/"
            }
          ],
          "name" => "stat-boosts",
          "names" => [
            %{
              "language" => %{
                "name" => "en",
                "url" => "https://pokeapi.co/api/v2/language/9/"
              },
              "name" => "Stat boosts"
            }
          ],
          "pocket" => %{
            "name" => "battle",
            "url" => "https://pokeapi.co/api/v2/item-pocket/7/"
          }
        }}

      iex> MaxElixirPokeApi.ItemCategory.get(9999)
      {:error, %{reason: "HTTP Status '404'"}}

      iex> MaxElixirPokeApi.ItemCategory.get(:banana)
      {:error, %{reason: "&1 only accepts string or integer."}}
  """
  @spec get(id_or_name) :: {:ok, map} | {:error, %{reason: String.t()}}
  def get(id_or_name) when is_bitstring(id_or_name) or is_integer(id_or_name), do: Request.get("item-category", id_or_name)
  def get(_), do: {:error, %{reason: "&1 only accepts string or integer."}}
end
