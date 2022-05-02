defmodule MaxElixirPokeApi.Resources.Berry do
  defmacro __using__(_) do
    quote do
      import MaxElixirPokeApi.Helpers.{Decoder, Get}
      alias MaxElixirPokeApi.Constants.{Endpoint}
      alias MaxElixirPokeApi.Resources.{BerryFlavorMap}
      alias MaxElixirPokeApi.Resources.Utility.CommonModels.{NamedAPIResource}

      @endpoint Endpoint.get(:berry)

      mdecode ~w(id name growth_time max_harvest natural_gift_power size smoothness soil_dryness firmness item natural_gift_type flavors) do
        mlist :flavors, BerryFlavorMap
        mstruct :firmness, NamedAPIResource
        mstruct :item, NamedAPIResource
        mstruct :natural_gift_type, NamedAPIResource
      end

      mget @endpoint
    end
  end
end
