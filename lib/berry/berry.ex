defmodule MaxElixirPokeApi.Berry do
  alias MaxElixirPokeApi, as: MaxElixir
  alias MaxElixirPokeApi.BerryFlavorMap, as: BerryFlavorMap
  alias MaxElixirPokeApi.Utility.CommonModels.NamedAPIResource, as: NamedAPIResource

  defstruct [
    :id,
    :name,
    :growth_time,
    :max_harvest,
    :natural_gift_power,
    :size,
    :smoothness,
    :soil_dryness,
    :firmness,
    :flavors,
    :item,
    :natural_gift_type,
  ]

  @keys ~w(id name growth_time max_harvest natural_gift_power size smoothness soil_dryness firmness flavors item natural_gift_type)

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
          |> Poison.decode!()
          |> decode()
      is_integer(berry) ->
        MaxElixir.uri <> "berry/" <> to_string(berry)
          |> MaxElixir.get()
          |> Poison.decode!()
          |> decode()
      true ->
        :wrong_entry
    end
  end

  def decode(%{} = map) do
    map
      |> Map.take(@keys)
      |> Enum.map(fn({k, v}) -> {String.to_existing_atom(k), v} end)
      |> Enum.map(&decode/1)
      |> fn(data) -> struct(__MODULE__, data) end.()
  end

  def decode({:flavors, flavors}) when is_list(flavors) do
    {:flavors, Enum.map(flavors, &BerryFlavorMap.decode/1)}
  end

  def decode({k, _v} = data) when (k == :firmness or k == :item or k == :natural_gift_type), do: NamedAPIResource.decode(data)

  def decode({k, v}), do: {k, v}
end
