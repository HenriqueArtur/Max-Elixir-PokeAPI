defmodule MaxElixirPokeApi.Version do
  @moduledoc """
  The Version module.
  """

  @typedoc """
  Identifier as `{id or name}` used in `https://pokeapi.co/api/v2/{resource}/{id or name}/`
  """
  @type id_or_name :: String.t() | integer()

  alias MaxElixirPokeApi.Request

  @doc """
  Return a Version.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/version/{id or name}/`

  ## Examples

      iex> MaxElixirPokeApi.Version.get("red")
      {:ok,
        %{
          "id" => 1,
          "name" => "red",
          "names" => [
            %{
              "language" => %{
                "name" => "ja-Hrkt",
                "url" => "https://pokeapi.co/api/v2/language/1/"
              },
              "name" => "赤"
            },
            %{
              "language" => %{
                "name" => "ko",
                "url" => "https://pokeapi.co/api/v2/language/3/"
              },
              "name" => "레드"
            },
            %{
              "language" => %{
                "name" => "zh-Hant",
                "url" => "https://pokeapi.co/api/v2/language/4/"
              },
              "name" => "紅"
            },
            %{
              "language" => %{
                "name" => "fr",
                "url" => "https://pokeapi.co/api/v2/language/5/"
              },
              "name" => "Rouge"
            },
            %{
              "language" => %{
                "name" => "de",
                "url" => "https://pokeapi.co/api/v2/language/6/"
              },
              "name" => "Rot"
            },
            %{
              "language" => %{
                "name" => "es",
                "url" => "https://pokeapi.co/api/v2/language/7/"
              },
              "name" => "Rojo"
            },
            %{
              "language" => %{
                "name" => "it",
                "url" => "https://pokeapi.co/api/v2/language/8/"
              },
              "name" => "Rossa"
            },
            %{
              "language" => %{
                "name" => "en",
                "url" => "https://pokeapi.co/api/v2/language/9/"
              },
              "name" => "Red"
            },
            %{
              "language" => %{
                "name" => "zh-Hans",
                "url" => "https://pokeapi.co/api/v2/language/12/"
              },
              "name" => "紅"
            }
          ],
          "version_group" => %{
            "name" => "red-blue",
            "url" => "https://pokeapi.co/api/v2/version-group/1/"
          }
        }}

      iex> MaxElixirPokeApi.Version.get(101)
      {:error, %{reason: "HTTP Status '404'"}}

      iex> MaxElixirPokeApi.Version.get(:banana)
      {:error, %{reason: "&1 only accepts string or integer."}}
  """
  @spec get(id_or_name) :: {:ok, map} | {:error, %{reason: String.t()}}
  def get(id_or_name) when is_bitstring(id_or_name) or is_integer(id_or_name), do: Request.get("version", id_or_name)
  def get(_), do: {:error, %{reason: "&1 only accepts string or integer."}}
end
