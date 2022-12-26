defmodule MaxElixirPokeApiTest do
  use ExUnit.Case
  doctest MaxElixirPokeApi

  @tag :pending
  test "resource invalid [aton]" do
    assert MaxElixirPokeApi.resource(:banana) == {:error, %{reason: "resource invalid."}}
  end

  @tag :pending
  test "resource invalid [string]" do
    assert MaxElixirPokeApi.resource("banana") == {:error, %{reason: "resource invalid."}}
  end

  @tag :pending
  test "resource invalid [number]" do
    assert MaxElixirPokeApi.resource(1) == {:error, %{reason: "resource invalid."}}
  end

  @tag :pending
  test "berry resource" do
    berry_resource = {:ok,
    %{
      "count" => 64,
      "next" => "https://pokeapi.co/api/v2/berry?offset=20&limit=20",
      "previous" => nil,
      "results" => [
        %{"name" => "cheri", "url" => "https://pokeapi.co/api/v2/berry/1/"},
        %{"name" => "chesto", "url" => "https://pokeapi.co/api/v2/berry/2/"},
        %{"name" => "pecha", "url" => "https://pokeapi.co/api/v2/berry/3/"},
        %{"name" => "rawst", "url" => "https://pokeapi.co/api/v2/berry/4/"},
        %{"name" => "aspear", "url" => "https://pokeapi.co/api/v2/berry/5/"},
        %{"name" => "leppa", "url" => "https://pokeapi.co/api/v2/berry/6/"},
        %{"name" => "oran", "url" => "https://pokeapi.co/api/v2/berry/7/"},
        %{"name" => "persim", "url" => "https://pokeapi.co/api/v2/berry/8/"},
        %{"name" => "lum", "url" => "https://pokeapi.co/api/v2/berry/9/"},
        %{"name" => "sitrus", "url" => "https://pokeapi.co/api/v2/berry/10/"},
        %{"name" => "figy", "url" => "https://pokeapi.co/api/v2/berry/11/"},
        %{"name" => "wiki", "url" => "https://pokeapi.co/api/v2/berry/12/"},
        %{"name" => "mago", "url" => "https://pokeapi.co/api/v2/berry/13/"},
        %{"name" => "aguav", "url" => "https://pokeapi.co/api/v2/berry/14/"},
        %{"name" => "iapapa", "url" => "https://pokeapi.co/api/v2/berry/15/"},
        %{"name" => "razz", "url" => "https://pokeapi.co/api/v2/berry/16/"},
        %{"name" => "bluk", "url" => "https://pokeapi.co/api/v2/berry/17/"},
        %{"name" => "nanab", "url" => "https://pokeapi.co/api/v2/berry/18/"},
        %{"name" => "wepear", "url" => "https://pokeapi.co/api/v2/berry/19/"},
        %{"name" => "pinap", "url" => "https://pokeapi.co/api/v2/berry/20/"}
      ]
    }}
    assert MaxElixirPokeApi.resource(:berry) == berry_resource
  end
end