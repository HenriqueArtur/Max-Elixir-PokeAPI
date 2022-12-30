defmodule MaxElixirPokeApi.BerryFirmness do
  @moduledoc """
  The Berry Firmness module.
  """

  @typedoc """
  Identifier as `{id or name}` used in `https://pokeapi.co/api/v2/{resource}/{id or name}/`
  """
  @type id_or_name :: String.t() | integer()

  alias MaxElixirPokeApi.Request

  @doc """
  Return a Berry Firmness.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/berry-firmness/{id or name}/`

  ## Examples

      iex> MaxElixirPokeApi.BerryFirmness.get("very-soft")
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

      iex> MaxElixirPokeApi.BerryFirmness.get(101)
      {:error, %{reason: "HTTP Status '404'"}}

      iex> MaxElixirPokeApi.BerryFirmness.get(:banana)
      {:error, %{reason: "&1 only accepts string or integer."}}
  """
  @spec get(id_or_name) :: {:ok, map} | {:error, %{reason: String.t()}}
  def get(id_or_name) when is_bitstring(id_or_name) or is_integer(id_or_name), do: Request.get("berry-firmness", id_or_name)
  def get(_), do: {:error, %{reason: "&1 only accepts string or integer."}}
end
