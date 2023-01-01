defmodule MaxElixirPokeApi.MixProject do
  use Mix.Project

  def project do
    [
      app: :max_elixir_poke_api,
      version: "0.9.0",
      elixir: "~> 1.13",
      deps: deps(),
      start_permanent: Mix.env() == :prod,

      # Doc
      name: "MaxElixirPokeApi",
      source_url: "https://github.com/HenriqueArtur/Max-Elixir-PokeAPI",
      homepage_url: "https://github.com/HenriqueArtur/Max-Elixir-PokeAPI",
      docs: [
        main: "MaxElixirPokeApi", # The main page in the docs
        # logo: "path/to/logo.png",
        extras: ["README.md"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :httpoison]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.7"},
      {:jason, "~> 1.2"},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false}
    ]
  end
end
