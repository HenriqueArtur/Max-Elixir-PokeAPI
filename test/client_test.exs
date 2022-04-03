defmodule ClientTest do
  use ExUnit.Case

  describe "get/1" do
    test "return 200" do
      param = "berry/1"
      map = %{
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
      expected_response = {:ok, map}
      response = Client.get(param)
      assert response == expected_response
    end
  end
end
