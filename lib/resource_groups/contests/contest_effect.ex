defmodule MaxElixirPokeApi.ContestEffect do
  @moduledoc """
  The Contest Effect module.
  """

  alias MaxElixirPokeApi.Request

  @doc """
  Return a Contest Effect.

  ## Parameters

    - **id:** `Integer` that represents the resource identify. `https://pokeapi.co/api/v2/contest-effect/{id}/`

  ## Examples

      iex> MaxElixirPokeApi.ContestEffect.get(1)
      {:ok,
        %{
          "appeal" => 4,
          "effect_entries" => [
            %{
              "effect" => "Gives a high number of appeal points wth no other effects.",
              "language" => %{
                "name" => "en",
                "url" => "https://pokeapi.co/api/v2/language/9/"
              }
            }
          ],
          "flavor_text_entries" => [
            %{
              "flavor_text" => "A highly appealing move.",
              "language" => %{
                "name" => "en",
                "url" => "https://pokeapi.co/api/v2/language/9/"
              }
            }
          ],
          "id" => 1,
          "jam" => 0
        }}

      iex> MaxElixirPokeApi.ContestEffect.get("banana")
      {:error, %{reason: "&1 only accepts integer."}}

      iex> MaxElixirPokeApi.ContestEffect.get(:banana)
      {:error, %{reason: "&1 only accepts integer."}}
  """
  @spec get(integer) :: {:ok, map} | {:error, %{reason: String.t()}}
  def get(id) when is_integer(id), do: Request.get("contest-effect", id)
  def get(_), do: {:error, %{reason: "&1 only accepts integer."}}
end
