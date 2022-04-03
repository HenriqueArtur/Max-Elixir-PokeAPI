defmodule MaxElixirPokeApi.BerryFlavor do
  import Decoder
  import Get
  alias Constant.Endpoint, as: Endpoint
  alias MaxElixirPokeApi.BerryFlavorMap, as: BerryFlavorMap
  alias MaxElixirPokeApi.Utility.CommonModels.Name, as: Name
  alias MaxElixirPokeApi.Utility.CommonModels.NamedAPIResource, as: NamedAPIResource

  @endpoint Endpoint.get(:berry_flavor)

  mdecode ~w(id name berries contest_type names) do
    mlist :names, Name
    mlist :berries, BerryFlavorMap
    mstruct :contest_type, NamedAPIResource
  end

  mget @endpoint
end
