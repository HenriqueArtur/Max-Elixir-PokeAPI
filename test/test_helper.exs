ExUnit.start()

Mox.defmock(Http.Mock, for: Http.Behaviour)
Application.put_env(:max_elixir_poke_api, :http_adapter, Http.Mock)
