defmodule MaxElixirPokeApi.BerryFirmness do
  import MaxElixirPokeApi

  @keys [
    id: nil,
    name: nil,
    berries: %MaxElixirPokeApi.NamedApiResource{},
    names: nil,
  ]

  defstruct @keys
end
