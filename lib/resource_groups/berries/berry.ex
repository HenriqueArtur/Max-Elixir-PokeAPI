defmodule MaxElixirPokeApi.Berry do
  @moduledoc """
  The Berry module.
  """

  @typedoc """
  Identifier as `{id or name}` used in `https://pokeapi.co/api/v2/{resource}/{id or name}/`
  """
  @type id_or_name :: String.t() | integer()

  alias MaxElixirPokeApi.Request

  @doc """
  Return a Berry.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/berry/{id or name}/`

  ## Examples

      iex> MaxElixirPokeApi.Berry.get("cheri")
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

      iex> MaxElixirPokeApi.Berry.get(101)
      {:error, %{reason: "HTTP Status '404'"}}

      iex> MaxElixirPokeApi.Berry.get(:banana)
      {:error, %{reason: "&1 only accepts string or integer."}}
  """
  @spec get(id_or_name) :: {:ok, map} | {:error, %{reason: String.t()}}
  def get(id_or_name) when is_bitstring(id_or_name) or is_integer(id_or_name), do: Request.get("berry", id_or_name)
  def get(_), do: {:error, %{reason: "&1 only accepts string or integer."}}
end
