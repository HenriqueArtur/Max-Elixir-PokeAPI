defmodule MaxElixirPokeApi.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Cachex, name: :max_elixir_cache}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MaxElixirPokeApi.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
