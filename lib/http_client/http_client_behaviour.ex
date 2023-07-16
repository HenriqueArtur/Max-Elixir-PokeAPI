defmodule MaxElixirPokeApi.HttpClient.Behaviour do
  @callback get(url :: String.t()) ::
  {:error, [{any, any}, ...] | %{reason: String.t()}} | {:ok, any}
end
