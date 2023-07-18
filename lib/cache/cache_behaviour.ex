defmodule MaxElixirPokeApi.Cache.Behaviour do
  @callback exists?(atom(), String.t()) :: {atom, boolean}

  @callback get(atom(), String.t()) :: {atom, any}

  @callback put(atom(), String.t(), any) :: {atom, any}
end
