defmodule MaxElixirPokeApi.ItemFlingEffect do
  @moduledoc """
  The Item Fling Effect module.
  """

  @typedoc """
  Identifier as `{id or name}` used in `https://pokeapi.co/api/v2/{resource}/{id or name}/`
  """
  @type id_or_name :: String.t() | integer()

  alias MaxElixirPokeApi.Request

  @doc """
  Return a Item Fling Effect.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/item-fling-effect/{id or name}/`

  ## Examples

      iex> MaxElixirPokeApi.ItemFlingEffect.get("badly-poison")
      {:ok,
        %{
          "effect_entries" => [
            %{
              "effect" => "Badly poisons the target.",
              "language" => %{
                "name" => "en",
                "url" => "https://pokeapi.co/api/v2/language/9/"
              }
            }
          ],
          "id" => 1,
          "items" => [
            %{"name" => "toxic-orb", "url" => "https://pokeapi.co/api/v2/item/249/"}
          ],
          "name" => "badly-poison"
        }}

      iex> MaxElixirPokeApi.ItemFlingEffect.get(9999)
      {:error, %{reason: "HTTP Status '404'"}}

      iex> MaxElixirPokeApi.ItemFlingEffect.get(:banana)
      {:error, %{reason: "&1 only accepts string or integer."}}
  """
  @spec get(id_or_name) :: {:ok, map} | {:error, %{reason: String.t()}}
  def get(id_or_name) when is_bitstring(id_or_name) or is_integer(id_or_name), do: Request.get("item-fling-effect", id_or_name)
  def get(_), do: {:error, %{reason: "&1 only accepts string or integer."}}
end
