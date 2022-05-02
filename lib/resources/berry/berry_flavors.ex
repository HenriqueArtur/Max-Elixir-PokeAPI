defmodule MaxElixirPokeApi.Resources.BerryFlavor do
  import MaxElixirPokeApi.Helpers.{Decoder, Get}
  alias MaxElixirPokeApi.Constants.{Endpoint}
  alias MaxElixirPokeApi.Resources.{BerryFlavorMap}
  alias MaxElixirPokeApi.Resources.Utility.CommonModels.{Name, NamedAPIResource}

  @endpoint Endpoint.get(:berry_flavor)

  mdecode ~w(id name berries contest_type names) do
    mlist :names, Name
    mlist :berries, BerryFlavorMap
    mstruct :contest_type, NamedAPIResource
  end

  mget @endpoint
end
