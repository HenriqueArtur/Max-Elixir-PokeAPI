ExUnit.start()

Mox.defmock(MaxElixirPokeApi.Http.Mock, for: MaxElixirPokeApi.Http.Behaviour)
Application.put_env(:max_elixir_poke_api, :http_adapter, MaxElixirPokeApi.Http.Mock)
