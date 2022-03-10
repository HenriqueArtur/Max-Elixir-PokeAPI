defmodule MaxElixirPokeApi.Berry do
  import MaxElixirPokeApi.NamedApiResource

  @keys [
    id: nil,
    name: nil,
    growth_time: nil,
    max_harvest: nil,
    natural_gift_power: nil,
    size: nil,
    smoothness: nil,
    soil_dryness: nil,
    firmness: %MaxElixirPokeApi.NamedApiResource{},
    flavors: [],
    item: %MaxElixirPokeApi.NamedApiResource{},
    natural_gift_type: %MaxElixirPokeApi.NamedApiResource{},
  ]

  defstruct @keys
end
