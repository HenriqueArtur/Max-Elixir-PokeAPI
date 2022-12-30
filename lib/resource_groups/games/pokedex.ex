defmodule MaxElixirPokeApi.Pokedex do
  @moduledoc """
  The Pokedex module.
  """

  @typedoc """
  Identifier as `{id or name}` used in `https://pokeapi.co/api/v2/{resource}/{id or name}/`
  """
  @type id_or_name :: String.t() | integer()

  alias MaxElixirPokeApi.Request

  @doc """
  Return a Pokedex.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/pokedex/{id or name}/`

  ## Examples

      iex> MaxElixirPokeApi.Pokedex.get("kanto")
      {:ok,
        %{
          "descriptions" => [
            %{
              "description" => "Pokédex régional de Kanto dans Rouge/Bleu/Jaune",
              "language" => %{
                "name" => "fr",
                "url" => "https://pokeapi.co/api/v2/language/5/"
              }
            },
            %{
              "description" => "Rot/Blau/Gelb Kanto Dex",
              "language" => %{
                "name" => "de",
                "url" => "https://pokeapi.co/api/v2/language/6/"
              }
            },
            %{
              "description" => "Pokédex regional de Rojo/Azul/Amarillo",
              "language" => %{
                "name" => "es",
                "url" => "https://pokeapi.co/api/v2/language/7/"
              }
            },
            %{
              "description" => "Red/Blue/Yellow Kanto dex",
              "language" => %{
                "name" => "en",
                "url" => "https://pokeapi.co/api/v2/language/9/"
              }
            }
          ],
          "id" => 2,
          "is_main_series" => true,
          "name" => "kanto",
          "names" => [
            %{
              "language" => %{
                "name" => "fr",
                "url" => "https://pokeapi.co/api/v2/language/5/"
              },
              "name" => "Kanto"
            },
            %{
              "language" => %{
                "name" => "de",
                "url" => "https://pokeapi.co/api/v2/language/6/"
              },
              "name" => "Kanto"
            },
            %{
              "language" => %{
                "name" => "es",
                "url" => "https://pokeapi.co/api/v2/language/7/"
              },
              "name" => "Kanto"
            },
            %{
              "language" => %{
                "name" => "en",
                "url" => "https://pokeapi.co/api/v2/language/9/"
              },
              "name" => "Kanto"
            }
          ],
          "pokemon_entries" => [
            %{
              "entry_number" => 1,
              "pokemon_species" => %{
                "name" => "bulbasaur",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/1/"
              }
            },
            %{
              "entry_number" => 2,
              "pokemon_species" => %{
                "name" => "ivysaur",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/2/"
              }
            },
            %{
              "entry_number" => 3,
              "pokemon_species" => %{
                "name" => "venusaur",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/3/"
              }
            },
            %{
              "entry_number" => 4,
              "pokemon_species" => %{
                "name" => "charmander",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/4/"
              }
            },
            %{
              "entry_number" => 5,
              "pokemon_species" => %{
                "name" => "charmeleon",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/5/"
              }
            },
            %{
              "entry_number" => 6,
              "pokemon_species" => %{
                "name" => "charizard",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/6/"
              }
            },
            %{
              "entry_number" => 7,
              "pokemon_species" => %{
                "name" => "squirtle",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/7/"
              }
            },
            %{
              "entry_number" => 8,
              "pokemon_species" => %{
                "name" => "wartortle",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/8/"
              }
            },
            %{
              "entry_number" => 9,
              "pokemon_species" => %{
                "name" => "blastoise",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/9/"
              }
            },
            %{
              "entry_number" => 10,
              "pokemon_species" => %{
                "name" => "caterpie",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/10/"
              }
            },
            %{
              "entry_number" => 11,
              "pokemon_species" => %{
                "name" => "metapod",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/11/"
              }
            },
            %{
              "entry_number" => 12,
              "pokemon_species" => %{
                "name" => "butterfree",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/12/"
              }
            },
            %{
              "entry_number" => 13,
              "pokemon_species" => %{
                "name" => "weedle",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/13/"
              }
            },
            %{
              "entry_number" => 14,
              "pokemon_species" => %{
                "name" => "kakuna",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/14/"
              }
            },
            %{
              "entry_number" => 15,
              "pokemon_species" => %{
                "name" => "beedrill",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/15/"
              }
            },
            %{
              "entry_number" => 16,
              "pokemon_species" => %{
                "name" => "pidgey",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/16/"
              }
            },
            %{
              "entry_number" => 17,
              "pokemon_species" => %{
                "name" => "pidgeotto",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/17/"
              }
            },
            %{
              "entry_number" => 18,
              "pokemon_species" => %{
                "name" => "pidgeot",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/18/"
              }
            },
            %{
              "entry_number" => 19,
              "pokemon_species" => %{
                "name" => "rattata",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/19/"
              }
            },
            %{
              "entry_number" => 20,
              "pokemon_species" => %{
                "name" => "raticate",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/20/"
              }
            },
            %{
              "entry_number" => 21,
              "pokemon_species" => %{
                "name" => "spearow",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/21/"
              }
            },
            %{
              "entry_number" => 22,
              "pokemon_species" => %{
                "name" => "fearow",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/22/"
              }
            },
            %{
              "entry_number" => 23,
              "pokemon_species" => %{
                "name" => "ekans",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/23/"
              }
            },
            %{
              "entry_number" => 24,
              "pokemon_species" => %{
                "name" => "arbok",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/24/"
              }
            },
            %{
              "entry_number" => 25,
              "pokemon_species" => %{
                "name" => "pikachu",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/25/"
              }
            },
            %{
              "entry_number" => 26,
              "pokemon_species" => %{
                "name" => "raichu",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/26/"
              }
            },
            %{
              "entry_number" => 27,
              "pokemon_species" => %{
                "name" => "sandshrew",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/27/"
              }
            },
            %{
              "entry_number" => 28,
              "pokemon_species" => %{
                "name" => "sandslash",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/28/"
              }
            },
            %{
              "entry_number" => 29,
              "pokemon_species" => %{
                "name" => "nidoran-f",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/29/"
              }
            },
            %{
              "entry_number" => 30,
              "pokemon_species" => %{
                "name" => "nidorina",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/30/"
              }
            },
            %{
              "entry_number" => 31,
              "pokemon_species" => %{
                "name" => "nidoqueen",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/31/"
              }
            },
            %{
              "entry_number" => 32,
              "pokemon_species" => %{
                "name" => "nidoran-m",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/32/"
              }
            },
            %{
              "entry_number" => 33,
              "pokemon_species" => %{
                "name" => "nidorino",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/33/"
              }
            },
            %{
              "entry_number" => 34,
              "pokemon_species" => %{
                "name" => "nidoking",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/34/"
              }
            },
            %{
              "entry_number" => 35,
              "pokemon_species" => %{
                "name" => "clefairy",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/35/"
              }
            },
            %{
              "entry_number" => 36,
              "pokemon_species" => %{
                "name" => "clefable",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/36/"
              }
            },
            %{
              "entry_number" => 37,
              "pokemon_species" => %{
                "name" => "vulpix",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/37/"
              }
            },
            %{
              "entry_number" => 38,
              "pokemon_species" => %{
                "name" => "ninetales",
                "url" => "https://pokeapi.co/api/v2/pokemon-species/38/"
              }
            },
            %{
              "entry_number" => 39,
              "pokemon_species" => %{"name" => "jigglypuff", ...}
            },
            %{"entry_number" => 40, "pokemon_species" => %{...}},
            %{"entry_number" => 41, ...},
            %{...},
            ...
          ],
          "region" => %{
            "name" => "kanto",
            "url" => "https://pokeapi.co/api/v2/region/1/"
          },
          "version_groups" => [
            %{
              "name" => "red-blue",
              "url" => "https://pokeapi.co/api/v2/version-group/1/"
            },
            %{
              "name" => "yellow",
              "url" => "https://pokeapi.co/api/v2/version-group/2/"
            },
            %{
              "name" => "firered-leafgreen",
              "url" => "https://pokeapi.co/api/v2/version-group/7/"
            }
          ]
        }}

      iex> MaxElixirPokeApi.Pokedex.get(101)
      {:error, %{reason: "HTTP Status '404'"}}

      iex> MaxElixirPokeApi.Pokedex.get(:banana)
      {:error, %{reason: "&1 only accepts string or integer."}}
  """
  @spec get(id_or_name) :: {:ok, map} | {:error, %{reason: String.t()}}
  def get(id_or_name) when is_bitstring(id_or_name) or is_integer(id_or_name), do: Request.get("pokedex", id_or_name)
  def get(_), do: {:error, %{reason: "&1 only accepts string or integer."}}
end
