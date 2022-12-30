defmodule MaxElixirPokeApi.BerryFlavor do
  @moduledoc """
  The Berry Flavor module.
  """

  @typedoc """
  Identifier as `{id or name}` used in `https://pokeapi.co/api/v2/{resource}/{id or name}/`
  """
  @type id_or_name :: String.t() | integer()

  alias MaxElixirPokeApi.Request

  @doc """
  Return a Berry Flavor.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/berry-flavor/{id or name}/`

  ## Examples

      iex> MaxElixirPokeApi.BerryFlavor.get("spicy")
      {:ok,
        %{
          "berries" => [
            %{
              "berry" => %{
                "name" => "rowap",
                "url" => "https://pokeapi.co/api/v2/berry/64/"
              },
              "potency" => 10
            },
            %{
              "berry" => %{
                "name" => "leppa",
                "url" => "https://pokeapi.co/api/v2/berry/6/"
              },
              "potency" => 10
            },
            %{
              "berry" => %{
                "name" => "oran",
                "url" => "https://pokeapi.co/api/v2/berry/7/"
              },
              "potency" => 10
            },
            %{
              "berry" => %{
                "name" => "persim",
                "url" => "https://pokeapi.co/api/v2/berry/8/"
              },
              "potency" => 10
            },
            %{
              "berry" => %{
                "name" => "lum",
                "url" => "https://pokeapi.co/api/v2/berry/9/"
              },
              "potency" => 10
            },
            %{
              "berry" => %{
                "name" => "razz",
                "url" => "https://pokeapi.co/api/v2/berry/16/"
              },
              "potency" => 10
            },
            %{
              "berry" => %{
                "name" => "pinap",
                "url" => "https://pokeapi.co/api/v2/berry/20/"
              },
              "potency" => 10
            },
            %{
              "berry" => %{
                "name" => "pomeg",
                "url" => "https://pokeapi.co/api/v2/berry/21/"
              },
              "potency" => 10
            },
            %{
              "berry" => %{
                "name" => "qualot",
                "url" => "https://pokeapi.co/api/v2/berry/23/"
              },
              "potency" => 10
            },
            %{
              "berry" => %{
                "name" => "hondew",
                "url" => "https://pokeapi.co/api/v2/berry/24/"
              },
              "potency" => 10
            },
            %{
              "berry" => %{
                "name" => "nomel",
                "url" => "https://pokeapi.co/api/v2/berry/30/"
              },
              "potency" => 10
            },
            %{
              "berry" => %{
                "name" => "belue",
                "url" => "https://pokeapi.co/api/v2/berry/35/"
              },
              "potency" => 10
            },
            %{
              "berry" => %{
                "name" => "rindo",
                "url" => "https://pokeapi.co/api/v2/berry/39/"
              },
              "potency" => 10
            },
            %{
              "berry" => %{
                "name" => "shuca",
                "url" => "https://pokeapi.co/api/v2/berry/43/"
              },
              "potency" => 10
            },
            %{
              "berry" => %{
                "name" => "charti",
                "url" => "https://pokeapi.co/api/v2/berry/47/"
              },
              "potency" => 10
            },
            %{
              "berry" => %{
                "name" => "apicot",
                "url" => "https://pokeapi.co/api/v2/berry/57/"
              },
              "potency" => 10
            },
            %{
              "berry" => %{
                "name" => "cheri",
                "url" => "https://pokeapi.co/api/v2/berry/1/"
              },
              "potency" => 10
            },
            %{
              "berry" => %{
                "name" => "chople",
                "url" => "https://pokeapi.co/api/v2/berry/41/"
              },
              "potency" => 15
            },
            %{
              "berry" => %{
                "name" => "figy",
                "url" => "https://pokeapi.co/api/v2/berry/11/"
              },
              "potency" => 15
            },
            %{
              "berry" => %{
                "name" => "occa",
                "url" => "https://pokeapi.co/api/v2/berry/36/"
              },
              "potency" => 15
            },
            %{
              "berry" => %{
                "name" => "tamato",
                "url" => "https://pokeapi.co/api/v2/berry/26/"
              },
              "potency" => 20
            },
            %{
              "berry" => %{
                "name" => "tanga",
                "url" => "https://pokeapi.co/api/v2/berry/46/"
              },
              "potency" => 20
            },
            %{
              "berry" => %{
                "name" => "babiri",
                "url" => "https://pokeapi.co/api/v2/berry/51/"
              },
              "potency" => 25
            },
            %{
              "berry" => %{
                "name" => "starf",
                "url" => "https://pokeapi.co/api/v2/berry/59/"
              },
              "potency" => 30
            },
            %{
              "berry" => %{
                "name" => "liechi",
                "url" => "https://pokeapi.co/api/v2/berry/53/"
              },
              "potency" => 30
            },
            %{
              "berry" => %{
                "name" => "spelon",
                "url" => "https://pokeapi.co/api/v2/berry/31/"
              },
              "potency" => 30
            },
            %{
              "berry" => %{
                "name" => "petaya",
                "url" => "https://pokeapi.co/api/v2/berry/56/"
              },
              "potency" => 30
            },
            %{
              "berry" => %{
                "name" => "lansat",
                "url" => "https://pokeapi.co/api/v2/berry/58/"
              },
              "potency" => 30
            },
            %{
              "berry" => %{
                "name" => "enigma",
                "url" => "https://pokeapi.co/api/v2/berry/60/"
              },
              "potency" => 40
            }
          ],
          "contest_type" => %{
            "name" => "cool",
            "url" => "https://pokeapi.co/api/v2/contest-type/1/"
          },
          "id" => 1,
          "name" => "spicy",
          "names" => [
            %{
              "language" => %{
                "name" => "fr",
                "url" => "https://pokeapi.co/api/v2/language/5/"
              },
              "name" => "Épicé"
            },
            %{
              "language" => %{
                "name" => "en",
                "url" => "https://pokeapi.co/api/v2/language/9/"
              },
              "name" => "Spicy"
            }
          ]
        }}

      iex> MaxElixirPokeApi.BerryFlavor.get(101)
      {:error, %{reason: "HTTP Status '404'"}}

      iex> MaxElixirPokeApi.BerryFlavor.get(:banana)
      {:error, %{reason: "&1 only accepts string or integer."}}
  """
  @spec get(id_or_name) :: {:ok, map} | {:error, %{reason: String.t()}}
  def get(id_or_name) when is_bitstring(id_or_name) or is_integer(id_or_name), do: Request.get("berry-flavor", id_or_name)
  def get(_), do: {:error, %{reason: "&1 only accepts string or integer."}}
end
