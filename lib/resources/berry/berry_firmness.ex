defmodule MaxElixirPokeApi.Resources.BerryFirmness do
  defmacro __using__(_) do
    quote do
      import MaxElixirPokeApi.Helpers.{Decoder, Get}
      alias MaxElixirPokeApi.Constants.{Endpoint}
      alias MaxElixirPokeApi.Resources.Utility.CommonModels.{Name, NamedAPIResource}

      @endpoint Endpoint.get(:berry_firmness)

      mdecode ~w(id name berries names) do
        mlist :names, Name
        mlist :berries, NamedAPIResource
      end

      mget @endpoint
    end
  end
end
