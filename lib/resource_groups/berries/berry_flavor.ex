defmodule MaxElixirPokeApi.BerryFlavor do
  @moduledoc false

  @type id_or_name :: String.t() | integer()

  alias MaxElixirPokeApi.Request

  @doc """
  Return a Berry Flavors.
  """
  @spec get(id_or_name) :: {:ok, map} | {:error, %{reason: String.t()}}
  def get(id_or_name) when is_bitstring(id_or_name) or is_integer(id_or_name), do: Request.get("berry-flavor", id_or_name)
  def get(_), do: {:error, %{reason: "&1 only accepts string or integer."}}
end
