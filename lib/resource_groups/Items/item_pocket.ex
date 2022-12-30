defmodule MaxElixirPokeApi.ItemPocket do
  @moduledoc """
  The Item Pocket module.
  """

  @typedoc """
  Identifier as `{id or name}` used in `https://pokeapi.co/api/v2/{resource}/{id or name}/`
  """
  @type id_or_name :: String.t() | integer()

  alias MaxElixirPokeApi.Request

  @doc """
  Return a Item Pocket.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/item-pocket/{id or name}/`

  ## Examples

      iex> MaxElixirPokeApi.ItemPocket.get("misc")
      {:ok,
        %{
          "categories" => [
            %{
              "name" => "collectibles",
              "url" => "https://pokeapi.co/api/v2/item-category/9/"
            },
            %{
              "name" => "evolution",
              "url" => "https://pokeapi.co/api/v2/item-category/10/"
            },
            %{
              "name" => "spelunking",
              "url" => "https://pokeapi.co/api/v2/item-category/11/"
            },
            %{
              "name" => "held-items",
              "url" => "https://pokeapi.co/api/v2/item-category/12/"
            },
            %{
              "name" => "choice",
              "url" => "https://pokeapi.co/api/v2/item-category/13/"
            },
            %{
              "name" => "effort-training",
              "url" => "https://pokeapi.co/api/v2/item-category/14/"
            },
            %{
              "name" => "bad-held-items",
              "url" => "https://pokeapi.co/api/v2/item-category/15/"
            },
            %{
              "name" => "training",
              "url" => "https://pokeapi.co/api/v2/item-category/16/"
            },
            %{
              "name" => "plates",
              "url" => "https://pokeapi.co/api/v2/item-category/17/"
            },
            %{
              "name" => "species-specific",
              "url" => "https://pokeapi.co/api/v2/item-category/18/"
            },
            %{
              "name" => "type-enhancement",
              "url" => "https://pokeapi.co/api/v2/item-category/19/"
            },
            %{
              "name" => "loot",
              "url" => "https://pokeapi.co/api/v2/item-category/24/"
            },
            %{
              "name" => "mulch",
              "url" => "https://pokeapi.co/api/v2/item-category/32/"
            },
            %{
              "name" => "dex-completion",
              "url" => "https://pokeapi.co/api/v2/item-category/35/"
            },
            %{
              "name" => "scarves",
              "url" => "https://pokeapi.co/api/v2/item-category/36/"
            },
            %{
              "name" => "jewels",
              "url" => "https://pokeapi.co/api/v2/item-category/42/"
            },
            %{
              "name" => "mega-stones",
              "url" => "https://pokeapi.co/api/v2/item-category/44/"
            },
            %{
              "name" => "memories",
              "url" => "https://pokeapi.co/api/v2/item-category/45/"
            },
            %{
              "name" => "species-candies",
              "url" => "https://pokeapi.co/api/v2/item-category/47/"
            },
            %{
              "name" => "dynamax-crystals",
              "url" => "https://pokeapi.co/api/v2/item-category/49/"
            },
            %{
              "name" => "curry-ingredients",
              "url" => "https://pokeapi.co/api/v2/item-category/51/"
            }
          ],
          "id" => 1,
          "name" => "misc",
          "names" => [
            %{
              "language" => %{
                "name" => "fr",
                "url" => "https://pokeapi.co/api/v2/language/5/"
              },
              "name" => "Objets"
            },
            %{
              "language" => %{
                "name" => "es",
                "url" => "https://pokeapi.co/api/v2/language/7/"
              },
              "name" => "Objetos"
            },
            %{
              "language" => %{
                "name" => "en",
                "url" => "https://pokeapi.co/api/v2/language/9/"
              },
              "name" => "Items"
            }
          ]
        }}

      iex> MaxElixirPokeApi.ItemPocket.get(9999)
      {:error, %{reason: "HTTP Status '404'"}}

      iex> MaxElixirPokeApi.ItemPocket.get(:banana)
      {:error, %{reason: "&1 only accepts string or integer."}}
  """
  @spec get(id_or_name) :: {:ok, map} | {:error, %{reason: String.t()}}
  def get(id_or_name) when is_bitstring(id_or_name) or is_integer(id_or_name), do: Request.get("item-pocket", id_or_name)
  def get(_), do: {:error, %{reason: "&1 only accepts string or integer."}}
end
