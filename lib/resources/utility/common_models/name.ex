defmodule MaxElixirPokeApi.Utility.CommonModels.Name do
  import MaxElixirPokeApi.Helpers.{Decoder}
  alias MaxElixirPokeApi.Resources.Utility.CommonModels.{NamedAPIResource}

  mdecode ~w(name language) do
    mstruct :language, NamedAPIResource
  end
end
