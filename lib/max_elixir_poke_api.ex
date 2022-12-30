defmodule MaxElixirPokeApi do
  @moduledoc """
  **WORKING IN PROGRESS**

  MaxElixirPokeApi is a Elixir Structured(?) wrapper for [PokeAPI](https://pokeapi.co/).

  This package has all function explicit in [PokeAPI Doc](https://pokeapi.co/docs/v2).
  """

  alias MaxElixirPokeApi.Berry
  alias MaxElixirPokeApi.BerryFirmness
  alias MaxElixirPokeApi.BerryFlavor
  alias MaxElixirPokeApi.Resource

  @typedoc """
  Resources from [PokeAPI](https://pokeapi.co/).
  """
  @type api_resource ::
      :berry
    | :berry_firmness
    | :berry_flavor
    | :contest_type
    | :contest_effect
    | :super_contest_effect
    | :encounter_method
    | :encounter_condition
    | :encounter_condition_value
    | :evolution_chain
    | :evolution_trigger
    | :generation
    | :pokedex
    | :version
    | :version_group
    | :item
    | :item_attribute
    | :item_category
    | :item_fling_effect
    | :item_pocket
    | :location
    | :location_area
    | :pal_park_area
    | :region
    | :machine
    | :move
    | :move_ailment
    | :move_battle_style
    | :move_category
    | :move_damage_class
    | :move_learn_method
    | :move_target
    | :ability
    | :characteristic
    | :egg_group
    | :gender
    | :growth_rate
    | :nature
    | :pokeathlon_stat
    | :pokemon
    | :pokemon_color
    | :pokemon_form
    | :pokemon_habitat
    | :pokemon_shape
    | :pokemon_species
    | :stat
    | :type
    | :language

  @typedoc """
  Identifier as `{id or name}` used in `https://pokeapi.co/api/v2/{resource}/{id or name}/`
  """
  @type id_or_name :: String.t() | integer()

  @doc """
  Return a paginated list of available resources for that API. By default, a list "page" will contain up to 20 resources.

  ## Parameters

    - **name:** `Atom` [`api_resource`] that represents the resource from Poke API.

  ## Examples

      iex> MaxElixirPokeApi.resource(:version)
      {:ok,
        %{
          "count" => 39,
          "next" => "https://pokeapi.co/api/v2/version?offset=20&limit=19",
          "previous" => nil,
          "results" => [
            %{"name" => "red", "url" => "https://pokeapi.co/api/v2/version/1/"},
            %{"name" => "blue", "url" => "https://pokeapi.co/api/v2/version/2/"},
            %{"name" => "yellow", "url" => "https://pokeapi.co/api/v2/version/3/"},
            %{"name" => "gold", "url" => "https://pokeapi.co/api/v2/version/4/"},
            %{"name" => "silver", "url" => "https://pokeapi.co/api/v2/version/5/"},
            %{"name" => "crystal", "url" => "https://pokeapi.co/api/v2/version/6/"},
            %{"name" => "ruby", "url" => "https://pokeapi.co/api/v2/version/7/"},
            %{"name" => "sapphire", "url" => "https://pokeapi.co/api/v2/version/8/"},
            %{"name" => "emerald", "url" => "https://pokeapi.co/api/v2/version/9/"},
            %{"name" => "firered", "url" => "https://pokeapi.co/api/v2/version/10/"},
            %{"name" => "leafgreen", "url" => "https://pokeapi.co/api/v2/version/11/"},
            %{"name" => "diamond", "url" => "https://pokeapi.co/api/v2/version/12/"},
            %{"name" => "pearl", "url" => "https://pokeapi.co/api/v2/version/13/"},
            %{"name" => "platinum", "url" => "https://pokeapi.co/api/v2/version/14/"},
            %{"name" => "heartgold", "url" => "https://pokeapi.co/api/v2/version/15/"},
            %{"name" => "soulsilver", "url" => "https://pokeapi.co/api/v2/version/16/"},
            %{"name" => "black", "url" => "https://pokeapi.co/api/v2/version/17/"},
            %{"name" => "white", "url" => "https://pokeapi.co/api/v2/version/18/"},
            %{"name" => "colosseum", "url" => "https://pokeapi.co/api/v2/version/19/"},
            %{"name" => "xd", "url" => "https://pokeapi.co/api/v2/version/20/"}
          ]
        }}

      iex> MaxElixirPokeApi.resource(:pokemon, 5, 5)
      {:ok,
        %{
          "count" => 1154,
          "next" => "https://pokeapi.co/api/v2/pokemon?offset=30&limit=5",
          "previous" => "https://pokeapi.co/api/v2/pokemon?offset=20&limit=5",
          "results" => [
            %{"name" => "raichu", "url" => "https://pokeapi.co/api/v2/pokemon/26/"},
            %{"name" => "sandshrew", "url" => "https://pokeapi.co/api/v2/pokemon/27/"},
            %{"name" => "sandslash", "url" => "https://pokeapi.co/api/v2/pokemon/28/"},
            %{"name" => "nidoran-f", "url" => "https://pokeapi.co/api/v2/pokemon/29/"},
            %{"name" => "nidorina", "url" => "https://pokeapi.co/api/v2/pokemon/30/"}
          ]
        }}

      iex> MaxElixirPokeApi.resource(:banana)
      {:error, %{reason: "resource invalid."}}
  """
  @spec resource(api_resource, integer, integer) :: {:ok, map} | {:error, %{reason: String.t()}}
  def resource(name, limit \\ 20, page \\ 0), do: Resource.resource(name, limit, page)

  @doc """
  Return a Berry.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/berry/{id or name}/`

  ## Examples

      iex> MaxElixirPokeApi.berry("cheri")
      {:ok,
        %{
          "firmness" => %{
            "name" => "soft",
            "url" => "https://pokeapi.co/api/v2/berry-firmness/2/"
          },
          "flavors" => [
            %{
              "flavor" => %{
                "name" => "spicy",
                "url" => "https://pokeapi.co/api/v2/berry-flavor/1/"
              },
              "potency" => 10
            },
            %{
              "flavor" => %{
                "name" => "dry",
                "url" => "https://pokeapi.co/api/v2/berry-flavor/2/"
              },
              "potency" => 0
            },
            %{
              "flavor" => %{
                "name" => "sweet",
                "url" => "https://pokeapi.co/api/v2/berry-flavor/3/"
              },
              "potency" => 0
            },
            %{
              "flavor" => %{
                "name" => "bitter",
                "url" => "https://pokeapi.co/api/v2/berry-flavor/4/"
              },
              "potency" => 0
            },
            %{
              "flavor" => %{
                "name" => "sour",
                "url" => "https://pokeapi.co/api/v2/berry-flavor/5/"
              },
              "potency" => 0
            }
          ],
          "growth_time" => 3,
          "id" => 1,
          "item" => %{
            "name" => "cheri-berry",
            "url" => "https://pokeapi.co/api/v2/item/126/"
          },
          "max_harvest" => 5,
          "name" => "cheri",
          "natural_gift_power" => 60,
          "natural_gift_type" => %{
            "name" => "fire",
            "url" => "https://pokeapi.co/api/v2/type/10/"
          },
          "size" => 20,
          "smoothness" => 25,
          "soil_dryness" => 15
        }}

      iex> MaxElixirPokeApi.berry(101)
      {:error, %{reason: "HTTP Status '404'"}}

      iex> MaxElixirPokeApi.berry(:banana)
      {:error, %{reason: "&1 only accepts string or integer."}}
  """
  @spec berry(id_or_name) :: {:ok, map} | {:error, %{reason: String.t()}}
  def berry(id_or_name), do: Berry.get(id_or_name)

  @doc """
  Return a Berry Firmnesses.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/berry-firmness/{id or name}/`

  ## Examples

      iex> MaxElixirPokeApi.berry_firmness("very-soft")
      {:ok,
        %{
          "berries" => [
            %{"name" => "pecha", "url" => "https://pokeapi.co/api/v2/berry/3/"},
            %{"name" => "pamtre", "url" => "https://pokeapi.co/api/v2/berry/32/"},
            %{"name" => "belue", "url" => "https://pokeapi.co/api/v2/berry/35/"},
            %{"name" => "wacan", "url" => "https://pokeapi.co/api/v2/berry/38/"},
            %{"name" => "tanga", "url" => "https://pokeapi.co/api/v2/berry/46/"},
            %{"name" => "charti", "url" => "https://pokeapi.co/api/v2/berry/47/"},
            %{"name" => "chilan", "url" => "https://pokeapi.co/api/v2/berry/52/"},
            %{"name" => "rowap", "url" => "https://pokeapi.co/api/v2/berry/64/"}
          ],
          "id" => 1,
          "name" => "very-soft",
          "names" => [
            %{
              "language" => %{
                "name" => "fr",
                "url" => "https://pokeapi.co/api/v2/language/5/"
              },
              "name" => "Très tendre"
            },
            %{
              "language" => %{
                "name" => "es",
                "url" => "https://pokeapi.co/api/v2/language/7/"
              },
              "name" => "Muy blanda"
            },
            %{
              "language" => %{
                "name" => "en",
                "url" => "https://pokeapi.co/api/v2/language/9/"
              },
              "name" => "Very Soft"
            }
          ]
        }}

      iex> MaxElixirPokeApi.berry_firmness(101)
      {:error, %{reason: "HTTP Status '404'"}}

      iex> MaxElixirPokeApi.berry_firmness(:banana)
      {:error, %{reason: "&1 only accepts string or integer."}}
  """
  @spec berry_firmness(id_or_name) :: {:ok, map} | {:error, %{reason: String.t()}}
  def berry_firmness(id_or_name), do: BerryFirmness.get(id_or_name)

  @doc """
  Return a Berry Flavors.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/berry-flavor/{id or name}/`

  ## Examples

      iex> MaxElixirPokeApi.berry_flavor("spicy")
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

      iex> MaxElixirPokeApi.berry_flavor(101)
      {:error, %{reason: "HTTP Status '404'"}}

      iex> MaxElixirPokeApi.berry_flavor(:banana)
      {:error, %{reason: "&1 only accepts string or integer."}}
  """
  @spec berry_flavor(id_or_name) :: {:ok, map} | {:error, %{reason: String.t()}}
  def berry_flavor(id_or_name), do: BerryFlavor.get(id_or_name)
end
