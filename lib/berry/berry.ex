defmodule MaxElixirPokeApi.Berry do
  alias MaxElixirPokeApi, as: MaxElixir
  alias MaxElixirPokeApi.BerryFlavorMap, as: BerryFlavorMap
  import Poison

  @keys [
    id: nil,
    name: nil,
    growth_time: nil,
    max_harvest: nil,
    natural_gift_power: nil,
    size: nil,
    smoothness: nil,
    soil_dryness: nil,
    firmness: %MaxElixir.NamedApiResource{},
    flavors: [],
    item: %MaxElixir.NamedApiResource{},
    natural_gift_type: %MaxElixir.NamedApiResource{},
  ]

  defstruct @keys

  def get(berry) do
    cond do
      is_bitstring(berry) ->
        MaxElixir.uri <> "berry/" <> URI.encode(berry)
          |> MaxElixir.get()
          |> Poison.decode!()
      is_integer(berry) ->
        MaxElixir.uri <> "berry/" <> to_string(berry)
          |> MaxElixir.get()
          |> Poison.decode!()
      true ->
        :wrong_entry
    end
  end

  def get(berry, :with_struct) do
    cond do
      is_bitstring(berry) ->
        MaxElixir.uri <> "berry/" <> URI.encode(berry)
          |> MaxElixir.get()
          |> Poison.decode!(as: %__MODULE__{})
          |> set_flavors_structs()
      is_integer(berry) ->
        MaxElixir.uri <> "berry/" <> to_string(berry)
          |> MaxElixir.get()
          |> Poison.decode!(as: %__MODULE__{})
          |> set_flavors_structs()
      true ->
        :wrong_entry
    end
  end

  defp set_flavors_structs(berry) do
    new_berry_struct = berry
    flavors = Enum.map(berry.flavors, fn flavor -> convert_flavor(flavor) end)
    new_berry_struct["flavors"] = flavors
    new_berry_struct
  end

  defp convert_flavor(flavor) do
    new_flavor = %BerryFlavorMap{}
    %{new_flavor | __struct__: BerryFlavorMap}
  end
end
