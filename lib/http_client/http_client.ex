defmodule MaxElixirPokeApi.HttpClient do
  @moduledoc false

  @typep url :: binary()

  @callback get(url) :: {:ok, map()} | {:error, binary() | map()}
end
