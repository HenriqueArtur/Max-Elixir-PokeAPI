defmodule MaxElixirPokeApi.Berry do
  import Decoder
  import Get
  alias Constant.Endpoint, as: Endpoint
  alias MaxElixirPokeApi.BerryFlavorMap, as: BerryFlavorMap
  alias MaxElixirPokeApi.Utility.CommonModels.NamedAPIResource, as: NamedAPIResource

  @endpoint Endpoint.get(:berry)

  mdecode ~w(id name growth_time max_harvest natural_gift_power size smoothness soil_dryness firmness item natural_gift_type flavors) do
    mlist :flavors, BerryFlavorMap
    mstruct :firmness, NamedAPIResource
    mstruct :item, NamedAPIResource
    mstruct :natural_gift_type, NamedAPIResource
  end

  mget @endpoint
end
