defmodule MaxElixirPokeApi.Http.ClientTest do
  use ExUnit.Case, async: true

  import Mox

  alias MaxElixirPokeApi.Http.{Mock, Client}

  setup do
    response = {
      :ok,
      %HTTPoison.Response{
        body: "{\"firmness\":{\"name\":\"soft\",\"url\":\"https://pokeapi.co/api/v2/berry-firmness/2/\"},\"flavors\":[{\"flavor\":{\"name\":\"spicy\",\"url\":\"https://pokeapi.co/api/v2/berry-flavor/1/\"},\"potency\":10},{\"flavor\":{\"name\":\"dry\",\"url\":\"https://pokeapi.co/api/v2/berry-flavor/2/\"},\"potency\":0},{\"flavor\":{\"name\":\"sweet\",\"url\":\"https://pokeapi.co/api/v2/berry-flavor/3/\"},\"potency\":0},{\"flavor\":{\"name\":\"bitter\",\"url\":\"https://pokeapi.co/api/v2/berry-flavor/4/\"},\"potency\":0},{\"flavor\":{\"name\":\"sour\",\"url\":\"https://pokeapi.co/api/v2/berry-flavor/5/\"},\"potency\":0}],\"growth_time\":3,\"id\":1,\"item\":{\"name\":\"cheri-berry\",\"url\":\"https://pokeapi.co/api/v2/item/126/\"},\"max_harvest\":5,\"name\":\"cheri\",\"natural_gift_power\":60,\"natural_gift_type\":{\"name\":\"fire\",\"url\":\"https://pokeapi.co/api/v2/type/10/\"},\"size\":20,\"smoothness\":25,\"soil_dryness\":15}",
        status_code: 200
      }
    }

    cheri_map = %{
      "firmness" => %{
        "name" => "soft",
        "url" => "https://pokeapi.co/api/v2/berry-firmness/2/"
      },
      "flavors" => [
        %{
          "flavor" => %{
            "name" => "spicy",
            "url" => "https://pokeapi.co/api/v2/berry-flavor/1/"
          },
          "potency" => 10
        },
        %{
          "flavor" => %{
            "name" => "dry",
            "url" => "https://pokeapi.co/api/v2/berry-flavor/2/"
          },
          "potency" => 0
        },
        %{
          "flavor" => %{
            "name" => "sweet",
            "url" => "https://pokeapi.co/api/v2/berry-flavor/3/"
          },
          "potency" => 0
        },
        %{
          "flavor" => %{
            "name" => "bitter",
            "url" => "https://pokeapi.co/api/v2/berry-flavor/4/"
          },
          "potency" => 0
        },
        %{
          "flavor" => %{
            "name" => "sour",
            "url" => "https://pokeapi.co/api/v2/berry-flavor/5/"
          },
          "potency" => 0
        }
      ],
      "growth_time" => 3,
      "id" => 1,
      "item" => %{
        "name" => "cheri-berry",
        "url" => "https://pokeapi.co/api/v2/item/126/"
      },
      "max_harvest" => 5,
      "name" => "cheri",
      "natural_gift_power" => 60,
      "natural_gift_type" => %{
        "name" => "fire",
        "url" => "https://pokeapi.co/api/v2/type/10/"
      },
      "size" => 20,
      "smoothness" => 25,
      "soil_dryness" => 15
    }

    cheri_endpoint = "berry/1"

    {:ok, cheri_map: cheri_map, cheri_endpoint: cheri_endpoint, response: response}
  end

  describe "get/1" do
    test "when success [:ok] and status [200]", %{cheri_map: map, cheri_endpoint: endpoint, response: response} do
      expect(Mock, :get, fn _ -> response end)
      expected_response = {:ok, map}
      response = Client.get(endpoint)
      assert response == expected_response
    end

    test "when success [:ok] and status [404]" do
      response = {
        :ok,
        %HTTPoison.Response{
          body: "",
          status_code: 404
        }
      }
      expect(Mock, :get, fn _ -> response end)

      response = Client.get("banana/1")
      assert {:error, _} = response
    end

    test "when fail [:error]" do
      response = {
        :error,
        reason: "Generic reason Mock",
      }
      expect(Mock, :get, fn _ -> response end)

      response = Client.get("banana/1")
      assert {:error, _} = response
    end
  end
end
