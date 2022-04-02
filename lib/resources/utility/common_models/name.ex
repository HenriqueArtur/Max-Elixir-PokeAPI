defmodule MaxElixirPokeApi.Utility.CommonModels.Name do
  import Decoder
  alias MaxElixirPokeApi.Utility.CommonModels.NamedAPIResource, as: NamedAPIResource

  mdecode ~w(name language) do
    mstruct :language, NamedAPIResource
  end
end
