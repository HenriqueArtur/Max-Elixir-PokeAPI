defmodule MaxElixirPokeApi.Utility.CommonModels.NamedAPIResource do
  defstruct [ :name, :url ]

  @keys ~w(name url)

  def decode(%{} = map) do
    map
      |> Map.take(@keys)
      |> Enum.map(fn({k, v}) -> {String.to_existing_atom(k), v} end)
      |> Enum.map(&decode/1)
      |> fn(data) -> struct(__MODULE__, data) end.()
  end

  def decode({k, v}) do
    named_api_struct = Enum.map(v, fn({key, value}) -> {String.to_existing_atom(key), value} end)
      |> fn(data) -> struct(__MODULE__, data) end.()
    { k, named_api_struct }
  end
end
