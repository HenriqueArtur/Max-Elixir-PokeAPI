defmodule MaxElixirPokeApi.Http.ClientBehaviour do
  @type url :: binary

  @callback get(url) :: {:ok, %{}} | {:error, %{}}
end
