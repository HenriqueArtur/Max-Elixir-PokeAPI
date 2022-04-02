defmodule MaxElixirPokeApi.BerryFlavorMap do
  import Decoder
  alias MaxElixirPokeApi.Utility.CommonModels.NamedAPIResource, as: NamedAPIResource

  mdecode ~w(potency flavor) do
    mstruct :flavor, NamedAPIResource
  end
end
