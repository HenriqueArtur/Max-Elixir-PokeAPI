defmodule MaxElixirPokeApi.EvolutionTrigger do
  @moduledoc """
  The Evolution Trigger module.
  """

  @typedoc """
  Identifier as `{id or name}` used in `https://pokeapi.co/api/v2/{resource}/{id or name}/`
  """
  @type id_or_name :: String.t() | integer()

  alias MaxElixirPokeApi.Request

  @doc """
  Return a Evolution Trigger.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/evolution-trigger/{id or name}/`

  ## Examples

      iex> MaxElixirPokeApi.EvolutionTrigger.get("trade")
      {:ok,
        %{
          "id" => 2,
          "name" => "trade",
          "names" => [
            %{
              "language" => %{
                "name" => "fr",
                "url" => "https://pokeapi.co/api/v2/language/5/"
              },
              "name" => "Échange"
            },
            %{
              "language" => %{
                "name" => "de",
                "url" => "https://pokeapi.co/api/v2/language/6/"
              },
              "name" => "Tausch"
            },
            %{
              "language" => %{
                "name" => "en",
                "url" => "https://pokeapi.co/api/v2/language/9/"
              },
              "name" => "Trade"
            }
          ],
          "pokemon_species" => [
            %{
              "name" => "alakazam",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/65/"
            },
            %{
              "name" => "machamp",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/68/"
            },
            %{
              "name" => "golem",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/76/"
            },
            %{
              "name" => "gengar",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/94/"
            },
            %{
              "name" => "politoed",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/186/"
            },
            %{
              "name" => "slowking",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/199/"
            },
            %{
              "name" => "steelix",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/208/"
            },
            %{
              "name" => "scizor",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/212/"
            },
            %{
              "name" => "kingdra",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/230/"
            },
            %{
              "name" => "porygon2",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/233/"
            },
            %{
              "name" => "huntail",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/367/"
            },
            %{
              "name" => "gorebyss",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/368/"
            },
            %{
              "name" => "rhyperior",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/464/"
            },
            %{
              "name" => "electivire",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/466/"
            },
            %{
              "name" => "magmortar",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/467/"
            },
            %{
              "name" => "porygon-z",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/474/"
            },
            %{
              "name" => "dusknoir",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/477/"
            },
            %{
              "name" => "gigalith",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/526/"
            },
            %{
              "name" => "conkeldurr",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/534/"
            },
            %{
              "name" => "escavalier",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/589/"
            },
            %{
              "name" => "accelgor",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/617/"
            },
            %{
              "name" => "milotic",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/350/"
            },
            %{
              "name" => "aromatisse",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/683/"
            },
            %{
              "name" => "trevenant",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/709/"
            },
            %{
              "name" => "gourgeist",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/711/"
            },
            %{
              "name" => "slurpuff",
              "url" => "https://pokeapi.co/api/v2/pokemon-species/685/"
            }
          ]
        }}

      iex> MaxElixirPokeApi.EvolutionTrigger.get(101)
      {:error, %{reason: "HTTP Status '404'"}}

      iex> MaxElixirPokeApi.EvolutionTrigger.get(:banana)
      {:error, %{reason: "&1 only accepts string or integer."}}
  """
  @spec get(id_or_name) :: {:ok, map} | {:error, %{reason: String.t()}}
  def get(id_or_name) when is_bitstring(id_or_name) or is_integer(id_or_name), do: Request.get("evolution-trigger", id_or_name)
  def get(_), do: {:error, %{reason: "&1 only accepts string or integer."}}
end
