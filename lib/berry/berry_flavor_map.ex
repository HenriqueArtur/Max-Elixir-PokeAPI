defmodule MaxElixirPokeApi.BerryFlavorMap do
  import MaxElixirPokeApi

  @keys [
    potency: nil,
    berries: %MaxElixirPokeApi.NamedApiResource{},
  ]

  defstruct @keys
end
