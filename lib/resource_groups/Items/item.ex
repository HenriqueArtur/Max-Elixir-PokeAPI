defmodule MaxElixirPokeApi.Item do
  @moduledoc """
  The Item module.
  """

  @typedoc """
  Identifier as `{id or name}` used in `https://pokeapi.co/api/v2/{resource}/{id or name}/`
  """
  @type id_or_name :: String.t() | integer()

  alias MaxElixirPokeApi.Request

  @doc """
  Return a Item.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/item/{id or name}/`

  ## Examples

      iex> MaxElixirPokeApi.Item.get(9999)
      {:error, %{reason: "HTTP Status '404'"}}

      iex> MaxElixirPokeApi.Item.get(:banana)
      {:error, %{reason: "&1 only accepts string or integer."}}
  """
  @spec get(id_or_name) :: {:ok, map} | {:error, %{reason: String.t()}}
  def get(id_or_name) when is_bitstring(id_or_name) or is_integer(id_or_name), do: Request.get("item", id_or_name)
  def get(_), do: {:error, %{reason: "&1 only accepts string or integer."}}
end
