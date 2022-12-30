defmodule MaxElixirPokeApi.SuperContestEffect do
  @moduledoc """
  The Contest Contest Effect module.
  """

  alias MaxElixirPokeApi.Request

  @doc """
  Return a Contest Contest Effect.

  ## Parameters

    - **id:** `Integer` that represents the resource identify. `https://pokeapi.co/api/v2/super-contest-effect/{id}/`

  ## Examples

      iex> MaxElixirPokeApi.SuperContestEffect.get(1)
      {:ok,
        %{
          "appeal" => 2,
          "flavor_text_entries" => [
            %{
              "flavor_text" => "Enables the user to perform first in the next turn.",
              "language" => %{
                "name" => "en",
                "url" => "https://pokeapi.co/api/v2/language/9/"
              }
            }
          ],
          "id" => 1,
          "moves" => [
            %{"name" => "agility", "url" => "https://pokeapi.co/api/v2/move/97/"},
            %{"name" => "quick-attack", "url" => "https://pokeapi.co/api/v2/move/98/"},
            %{"name" => "teleport", "url" => "https://pokeapi.co/api/v2/move/100/"},
            %{"name" => "double-team", "url" => "https://pokeapi.co/api/v2/move/104/"},
            %{"name" => "cotton-spore", "url" => "https://pokeapi.co/api/v2/move/178/"},
            %{"name" => "mach-punch", "url" => "https://pokeapi.co/api/v2/move/183/"},
            %{
              "name" => "extreme-speed",
              "url" => "https://pokeapi.co/api/v2/move/245/"
            },
            %{"name" => "tailwind", "url" => "https://pokeapi.co/api/v2/move/366/"},
            %{"name" => "me-first", "url" => "https://pokeapi.co/api/v2/move/382/"},
            %{"name" => "sucker-punch", "url" => "https://pokeapi.co/api/v2/move/389/"},
            %{"name" => "rock-polish", "url" => "https://pokeapi.co/api/v2/move/397/"},
            %{"name" => "vacuum-wave", "url" => "https://pokeapi.co/api/v2/move/410/"},
            %{"name" => "bullet-punch", "url" => "https://pokeapi.co/api/v2/move/418/"},
            %{"name" => "ice-shard", "url" => "https://pokeapi.co/api/v2/move/420/"},
            %{"name" => "shadow-sneak", "url" => "https://pokeapi.co/api/v2/move/425/"},
            %{"name" => "aqua-jet", "url" => "https://pokeapi.co/api/v2/move/453/"}
          ]
        }}

      iex> MaxElixirPokeApi.SuperContestEffect.get("banana")
      {:error, %{reason: "&1 only accepts integer."}}

      iex> MaxElixirPokeApi.SuperContestEffect.get(:banana)
      {:error, %{reason: "&1 only accepts integer."}}
  """
  @spec get(integer) :: {:ok, map} | {:error, %{reason: String.t()}}
  def get(id) when is_integer(id), do: Request.get("super-contest-effect", id)
  def get(_), do: {:error, %{reason: "&1 only accepts integer."}}
end
