defmodule MaxElixirPokeApi.Generation do
  @moduledoc """
  The Generation module.
  """

  @typedoc """
  Identifier as `{id or name}` used in `https://pokeapi.co/api/v2/{resource}/{id or name}/`
  """
  @type id_or_name :: String.t() | integer()

  alias MaxElixirPokeApi.Request

  @doc """
  Return a Generation.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/generation/{id or name}/`

  ## Examples

      iex> MaxElixirPokeApi.Generation.get("generation-i")
      {:ok,
        %{
          "abilities" => [],
          "id" => 1,
          "main_region" => %{
            "name" => "kanto",
            "url" => "https://pokeapi.co/api/v2/region/1/"
          },
          "moves" => [
            %{"name" => "pound", "url" => "https://pokeapi.co/api/v2/move/1/"},
            %{"name" => "karate-chop", "url" => "https://pokeapi.co/api/v2/move/2/"},
            %{"name" => "double-slap", "url" => "https://pokeapi.co/api/v2/move/3/"},
            %{"name" => "comet-punch", "url" => "https://pokeapi.co/api/v2/move/4/"},
            %{"name" => "mega-punch", "url" => "https://pokeapi.co/api/v2/move/5/"},
            %{"name" => "pay-day", "url" => "https://pokeapi.co/api/v2/move/6/"},
            %{"name" => "fire-punch", "url" => "https://pokeapi.co/api/v2/move/7/"},
            %{"name" => "ice-punch", "url" => "https://pokeapi.co/api/v2/move/8/"},
            %{"name" => "thunder-punch", "url" => "https://pokeapi.co/api/v2/move/9/"},
            %{"name" => "scratch", "url" => "https://pokeapi.co/api/v2/move/10/"},
            %{"name" => "vice-grip", "url" => "https://pokeapi.co/api/v2/move/11/"},
            %{"name" => "guillotine", "url" => "https://pokeapi.co/api/v2/move/12/"},
            %{"name" => "razor-wind", "url" => "https://pokeapi.co/api/v2/move/13/"},
            %{"name" => "swords-dance", "url" => "https://pokeapi.co/api/v2/move/14/"},
            %{"name" => "cut", "url" => "https://pokeapi.co/api/v2/move/15/"},
            %{"name" => "gust", "url" => "https://pokeapi.co/api/v2/move/16/"},
            %{"name" => "wing-attack", "url" => "https://pokeapi.co/api/v2/move/17/"},
            %{"name" => "whirlwind", "url" => "https://pokeapi.co/api/v2/move/18/"},
            %{"name" => "fly", "url" => "https://pokeapi.co/api/v2/move/19/"},
            %{"name" => "bind", "url" => "https://pokeapi.co/api/v2/move/20/"},
            %{"name" => "slam", "url" => "https://pokeapi.co/api/v2/move/21/"},
            %{"name" => "vine-whip", "url" => "https://pokeapi.co/api/v2/move/22/"},
            %{"name" => "stomp", "url" => "https://pokeapi.co/api/v2/move/23/"},
            %{"name" => "double-kick", "url" => "https://pokeapi.co/api/v2/move/24/"},
            %{"name" => "mega-kick", "url" => "https://pokeapi.co/api/v2/move/25/"},
            %{"name" => "jump-kick", "url" => "https://pokeapi.co/api/v2/move/26/"},
            %{"name" => "rolling-kick", "url" => "https://pokeapi.co/api/v2/move/27/"},
            %{"name" => "sand-attack", "url" => "https://pokeapi.co/api/v2/move/28/"},
            %{"name" => "headbutt", "url" => "https://pokeapi.co/api/v2/move/29/"},
            %{"name" => "horn-attack", "url" => "https://pokeapi.co/api/v2/move/30/"},
            %{"name" => "fury-attack", "url" => "https://pokeapi.co/api/v2/move/31/"},
            %{"name" => "horn-drill", "url" => "https://pokeapi.co/api/v2/move/32/"},
            %{"name" => "tackle", "url" => "https://pokeapi.co/api/v2/move/33/"},
            %{"name" => "body-slam", "url" => "https://pokeapi.co/api/v2/move/34/"},
            %{"name" => "wrap", "url" => "https://pokeapi.co/api/v2/move/35/"},
            %{"name" => "take-down", "url" => "https://pokeapi.co/api/v2/move/36/"},
            %{"name" => "thrash", "url" => "https://pokeapi.co/api/v2/move/37/"},
            %{"name" => "double-edge", "url" => "https://pokeapi.co/api/v2/move/38/"},
            %{"name" => "tail-whip", "url" => "https://pokeapi.co/api/v2/move/39/"},
            %{"name" => "poison-sting", "url" => "https://pokeapi.co/api/v2/move/40/"},
            %{"name" => "twineedle", "url" => "https://pokeapi.co/api/v2/move/41/"},
            %{"name" => "pin-missile", "url" => "https://pokeapi.co/api/v2/move/42/"},
            %{"name" => "leer", ...},
            %{...},
            ...
          ],
          "name" => "generation-i",
          "names" => [
            %{
              "language" => %{
                "name" => "ja-Hrkt",
                "url" => "https://pokeapi.co/api/v2/language/1/"
              },
              "name" => "だいいちせだい"
            },
            %{
              "language" => %{
                "name" => "ko",
                "url" => "https://pokeapi.co/api/v2/language/3/"
              },
              "name" => "1세대"
            },
            %{
              "language" => %{
                "name" => "fr",
                "url" => "https://pokeapi.co/api/v2/language/5/"
              },
              "name" => "Génération I"
            },
            %{
              "language" => %{
                "name" => "de",
                "url" => "https://pokeapi.co/api/v2/language/6/"
              },
              "name" => "Generation I"
            },
            %{
              "language" => %{
                "name" => "es",
                "url" => "https://pokeapi.co/api/v2/language/7/"
              },
              "name" => "Generación I"
            },
            %{
              "language" => %{
                "name" => "en",
                "url" => "https://pokeapi.co/api/v2/language/9/"
              },
              "name" => "Generation I"
            },
            %{
              "language" => %{
                "name" => "ja",
                "url" => "https://pokeapi.co/api/v2/language/11/"
              },
              "name" => "第一世代"
            }
          ],
          "pokemon_species" => [
            %{
              "name" => "bulbasaur",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/1/"
            },
            %{
              "name" => "charmander",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/4/"
            },
            %{
              "name" => "squirtle",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/7/"
            },
            %{
              "name" => "caterpie",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/10/"
            },
            %{
              "name" => "weedle",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/13/"
            },
            %{
              "name" => "pidgey",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/16/"
            },
            %{
              "name" => "rattata",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/19/"
            },
            %{
              "name" => "spearow",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/21/"
            },
            %{
              "name" => "ekans",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/23/"
            },
            %{
              "name" => "sandshrew",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/27/"
            },
            %{
              "name" => "nidoran-f",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/29/"
            },
            %{
              "name" => "nidoran-m",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/32/"
            },
            %{
              "name" => "vulpix",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/37/"
            },
            %{
              "name" => "zubat",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/41/"
            },
            %{
              "name" => "oddish",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/43/"
            },
            %{
              "name" => "paras",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/46/"
            },
            %{
              "name" => "venonat",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/48/"
            },
            %{
              "name" => "diglett",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/50/"
            },
            %{
              "name" => "meowth",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/52/"
            },
            %{
              "name" => "psyduck",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/54/"
            },
            %{
              "name" => "mankey",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/56/"
            },
            %{
              "name" => "growlithe",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/58/"
            },
            %{
              "name" => "poliwag",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/60/"
            },
            %{
              "name" => "abra",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/63/"
            },
            %{
              "name" => "machop",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/66/"
            },
            %{
              "name" => "bellsprout",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/69/"
            },
            %{
              "name" => "tentacool",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/72/"
            },
            %{
              "name" => "geodude",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/74/"
            },
            %{
              "name" => "ponyta",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/77/"
            },
            %{
              "name" => "slowpoke",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/79/"
            },
            %{
              "name" => "magnemite",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/81/"
            },
            %{
              "name" => "farfetchd",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/83/"
            },
            %{
              "name" => "doduo",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/84/"
            },
            %{
              "name" => "seel",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/86/"
            },
            %{
              "name" => "grimer",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/88/"
            },
            %{
              "name" => "shellder",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/90/"
            },
            %{
              "name" => "gastly",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/92/"
            },
            %{
              "name" => "onix",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/95/"
            },
            %{
              "name" => "drowzee",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/96/"
            },
            %{"name" => "krabby", ...},
            %{...},
            ...
          ],
          "types" => [
            %{"name" => "normal", "url" => "https://pokeapi.co/api/v2/type/1/"},
            %{"name" => "fighting", "url" => "https://pokeapi.co/api/v2/type/2/"},
            %{"name" => "flying", "url" => "https://pokeapi.co/api/v2/type/3/"},
            %{"name" => "poison", "url" => "https://pokeapi.co/api/v2/type/4/"},
            %{"name" => "ground", "url" => "https://pokeapi.co/api/v2/type/5/"},
            %{"name" => "rock", "url" => "https://pokeapi.co/api/v2/type/6/"},
            %{"name" => "bug", "url" => "https://pokeapi.co/api/v2/type/7/"},
            %{"name" => "ghost", "url" => "https://pokeapi.co/api/v2/type/8/"},
            %{"name" => "fire", "url" => "https://pokeapi.co/api/v2/type/10/"},
            %{"name" => "water", "url" => "https://pokeapi.co/api/v2/type/11/"},
            %{"name" => "grass", "url" => "https://pokeapi.co/api/v2/type/12/"},
            %{"name" => "electric", "url" => "https://pokeapi.co/api/v2/type/13/"},
            %{"name" => "psychic", "url" => "https://pokeapi.co/api/v2/type/14/"},
            %{"name" => "ice", "url" => "https://pokeapi.co/api/v2/type/15/"},
            %{"name" => "dragon", "url" => "https://pokeapi.co/api/v2/type/16/"}
          ],
          "version_groups" => [
            %{
              "name" => "red-blue",
              "url" => "https://pokeapi.co/api/v2/version-group/1/"
            },
            %{
              "name" => "yellow",
              "url" => "https://pokeapi.co/api/v2/version-group/2/"
            }
          ]
        }}

      iex> MaxElixirPokeApi.Generation.get(101)
      {:error, %{reason: "HTTP Status '404'"}}

      iex> MaxElixirPokeApi.Generation.get(:banana)
      {:error, %{reason: "&1 only accepts string or integer."}}
  """
  @spec get(id_or_name) :: {:ok, map} | {:error, %{reason: String.t()}}
  def get(id_or_name) when is_bitstring(id_or_name) or is_integer(id_or_name), do: Request.get("generation", id_or_name)
  def get(_), do: {:error, %{reason: "&1 only accepts string or integer."}}
end
