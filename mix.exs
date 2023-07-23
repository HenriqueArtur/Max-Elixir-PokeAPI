defmodule MaxElixirPokeApi.MixProject do
  use Mix.Project

  def project do
    [
      app: :max_elixir_poke_api,
      version: "1.0.0",
      elixir: "~> 1.13",
      deps: deps(),
      start_permanent: Mix.env() == :prod,

      # Doc
      name: "MaxElixirPokeApi",
      description: "A Elixir wrapper with auto caching for PokeAPI ",
      source_url: "https://github.com/HenriqueArtur/Max-Elixir-PokeAPI",
      homepage_url: "https://github.com/HenriqueArtur/Max-Elixir-PokeAPI",
      package: package(),
      docs: [
        main: "MaxElixirPokeApi", # The main page in the docs
        logo: "img/logo.png",
        # extras: ["README.md"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {MaxElixirPokeApi, []},
      extra_applications: [:logger, :httpoison]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.7"},
      {:jason, "~> 1.2"},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false},
      {:cachex, "~> 3.4"},
      {:patch, "~> 0.12.0", only: [:test]}
    ]
  end

  defp package() do
    [
      maintainers: ["Henrique Artur"],
      licenses: ["BSD-3-Clause"],
      links: %{"GitHub" => "https://github.com/HenriqueArtur/Max-Elixir-PokeAPI"}
    ]
  end
end
