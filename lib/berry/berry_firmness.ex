defmodule MaxElixirPokeApi.BerryFirmness do
  import Decoder
  import Get
  alias Client
  alias Constant.Endpoint, as: Endpoint
  alias MaxElixirPokeApi.Utility.CommonModels.Name, as: Name
  alias MaxElixirPokeApi.Utility.CommonModels.NamedAPIResource, as: NamedAPIResource

  @endpoint Endpoint.get(:berry_firmness)

  mdecode ~w(id name berries names) do
    mlist :names, Name
    mlist :berries, NamedAPIResource
  end

  mget @endpoint
end
