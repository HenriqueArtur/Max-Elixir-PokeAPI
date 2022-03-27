defmodule MaxElixirPokeApi.Berry do
  import Decoder
  alias Client
  alias Constant.Endpoint, as: Endpoint
  alias MaxElixirPokeApi.BerryFlavorMap, as: BerryFlavorMap
  alias MaxElixirPokeApi.Utility.CommonModels.NamedAPIResource, as: NamedAPIResource

  @endpoint Endpoint.get(:Berry)

  mdecode ~w(id name growth_time max_harvest natural_gift_power size smoothness soil_dryness firmness item natural_gift_type flavors) do
    mlist :flavors, BerryFlavorMap
    mstruct :firmness, NamedAPIResource
    mstruct :item, NamedAPIResource
    mstruct :natural_gift_type, NamedAPIResource
  end

  def get(berry) do
    cond do
      is_bitstring(berry) ->
        @endpoint <> URI.encode(berry)
          |> Client.get()
          |> Poison.decode!()
      is_integer(berry) ->
        @endpoint <> to_string(berry)
          |> Client.get()
          |> Poison.decode!()
      true ->
        :wrong_entry
    end
  end

  def get(berry, :with_struct) do
    get(berry) |> decode()
  end
end
