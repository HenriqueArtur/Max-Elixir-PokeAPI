defmodule MaxElixirPokeApi do
  import HTTPoison

  @uri "https://pokeapi.co/api/v2/"

  def uri, do: @uri

  def get(uri) do
    case HTTPoison.get(uri) do
      { :ok, %HTTPoison.Response{ body: body } } ->
        body
      { :error, %HTTPoison.Error{ reason: reason } } ->
        { :error, reason }
    end
  end
end
