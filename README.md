![MaxElixirPokeAPI Logo](img/logoFull.png)
<p align="center">
  <img src="https://img.shields.io/github/actions/workflow/status/HenriqueArtur/Max-Elixir-PokeAPI/elixir.yml?branch=master" alt="build">
  <img src="https://img.shields.io/hexpm/v/max_elixir_poke_api.svg" alt="Hex.pm Version">
  <img src="https://img.shields.io/badge/docs-latest-blue.svg" alt="Documentation">
</p>

MaxElixirPokeApi is a Elixir wrapper with auto caching for [PokeAPI](https://pokeapi.co/).

All API references explicit in [PokeAPI Doc](https://pokeapi.co/docs/v2).

To see all documentation access [https://hexdocs.pm/max_elixir_poke_api](https://hexdocs.pm/max_elixir_poke_api).

## Installation

As of v0.16.0, MaxElixirPokeAPI is available on [Hex](https://hex.pm/). You can install the package via:

```elixir
def deps do
  {:max_elixir_poke_api, "~> 0.16.0"}
end
```

## Usage

To use the resources just call `MaxElixirPokeApi.<resource_name>(id_or_name)`.

```elixir
MaxElixirPokeApi.berry(1)
```

To list resources use `MaxElixirPokeApi.resource(resource_aton, limit, page)`.

```elixir
MaxElixirPokeApi.resource(:berry, 5, 5)
```

If you want to create your own logic for calling resources use `MaxElixirPokeApi.Request.get(resource, id_or_name)`.

```elixir
MaxElixirPokeApi.Request.get("berry", 1)
```

Special thanks to [Tito](https://www.behance.net/titomarques) who made the logo!