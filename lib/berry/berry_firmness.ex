defmodule MaxElixirPokeApi.BerryFirmness do
  # @keys [
  #   id: nil,
  #   name: nil,
  #   berries: %MaxElixirPokeApi.NamedApiResource{},
  #   names: nil,
  # ]

  alias MaxElixirPokeApi.Utility.CommonModels.NamedApiResource, as: NamedApiResource

  defstruct [ :id, :name, :berries, :names ]

  @keys ~w(id name berries names)

  def decode(%{} = map) do
    map
      |> Map.take(@keys)
      |> Enum.map(fn({k, v}) -> {String.to_existing_atom(k), v} end)
      |> Enum.map(&decode/1)
      |> fn(data) -> struct(__MODULE__, data) end.()
  end

  def decode({k, v}), do: {k, v}
end
