defmodule MaxElixirPokeApi.Resources.BerryFlavorMap do
  import MaxElixirPokeApi.Helpers.{Decoder}
  alias MaxElixirPokeApi.Resources.Utility.CommonModels.{NamedAPIResource}

  mdecode ~w(potency flavor) do
    mstruct :flavor, NamedAPIResource
  end
end
