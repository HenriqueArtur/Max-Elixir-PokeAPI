defmodule MaxElixirPokeApi.BerryFlavor do
  import Decoder
  alias Client
  alias Constant.Endpoint, as: Endpoint
  alias MaxElixirPokeApi.BerryFlavorMap, as: BerryFlavorMap
  alias MaxElixirPokeApi.Utility.CommonModels.Name, as: Name
  alias MaxElixirPokeApi.Utility.CommonModels.NamedAPIResource, as: NamedAPIResource

  @endpoint Endpoint.get(:BerryFlavor)

  mdecode ~w(id name berries contest_type names) do
    mlist :names, Name
    mlist :berries, BerryFlavorMap
    mstruct :contest_type, NamedAPIResource
  end

  def get(berry_firmness) do
    cond do
      is_bitstring(berry_firmness) ->
        @endpoint <> URI.encode(berry_firmness)
          |> Client.get()
          |> Poison.decode!()
      is_integer(berry_firmness) ->
        @endpoint <> to_string(berry_firmness)
          |> Client.get()
          |> Poison.decode!()
      true ->
        :wrong_entry
    end
  end

  def get(berry_firmness, :with_struct) do
    get(berry_firmness) |> decode()
  end
end
