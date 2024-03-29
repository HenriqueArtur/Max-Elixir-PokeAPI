defmodule MaxElixirPokeApi do
  @moduledoc """
  MaxElixirPokeApi is a Elixir wrapper with auto caching for [PokeAPI](https://pokeapi.co/).

  This package has all function explicit in [PokeAPI Doc](https://pokeapi.co/docs/v2).

  To use the resources just call `MaxElixirPokeApi.<resource_name>(id_or_name)`.

  To list resources use `MaxElixirPokeApi.resource(resource_aton, limit, page)`.

  If you want to create your own logic for calling resources use `MaxElixirPokeApi.PokeAPI.fetch(resource, id_or_name)`.

  ## Examples

      iex> MaxElixirPokeApi.berry(1)
      {:ok,
        %{
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
        }}

      iex> MaxElixirPokeApi.resource(:berry, 5, 5)
      {:ok,
        %{
          "count" => 64,
          "next" => "https://pokeapi.co/api/v2/berry?offset=30&limit=5",
          "previous" => "https://pokeapi.co/api/v2/berry?offset=20&limit=5",
          "results" => [
            %{
              "name" => "tamato",
              "url" => "https://pokeapi.co/api/v2/berry/26/"
            },
            %{
              "name" => "cornn",
              "url" => "https://pokeapi.co/api/v2/berry/27/"
            },
            %{
              "name" => "magost",
              "url" => "https://pokeapi.co/api/v2/berry/28/"
            },
            %{
              "name" => "rabuta",
              "url" => "https://pokeapi.co/api/v2/berry/29/"
            },
            %{
              "name" => "nomel",
              "url" => "https://pokeapi.co/api/v2/berry/30/"
            }
          ]
        }}

      iex> MaxElixirPokeApi.PokeAPI.fetch("berry", 1)
      {:ok,
        %{
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
        }}
  """

  @behaviour MaxElixirPokeApi.Behaviour

  alias MaxElixirPokeApi.{
    Behaviour,
    PokeAPI
  }

  @type id_or_name :: Behaviour.id_or_name
  @type response :: Behaviour.response

  @resources_list %{
    berry: "berry",
    berry_firmness: "berry-firmness",
    berry_flavor: "berry-flavor",
    contest_type: "contest-type",
    contest_effect: "contest-effect",
    super_contest_effect: "super-contest-effect",
    encounter_method: "encounter-method",
    encounter_condition: "encounter-condition",
    encounter_condition_value: "encounter-condition-value",
    evolution_chain: "evolution-chain",
    evolution_trigger: "evolution-trigger",
    generation: "generation",
    pokedex: "pokedex",
    version: "version",
    version_group: "version-group",
    item: "item",
    item_attribute: "item-attribute",
    item_category: "item-category",
    item_fling_effect: "item-fling-effect",
    item_pocket: "item-pocket",
    location: "location",
    location_area: "location-area",
    pal_park_area: "pal-park-area",
    region: "region",
    machine: "machine",
    move: "move",
    move_ailment: "move-ailment",
    move_battle_style: "move-battle-style",
    move_category: "move-category",
    move_damage_class: "move-damage-class",
    move_learn_method: "move-learn-method",
    move_target: "move-target",
    ability: "ability",
    characteristic: "characteristic",
    egg_group: "egg-group",
    gender: "gender",
    growth_rate: "growth-rate",
    nature: "nature",
    pokeathlon_stat: "pokeathlon-stat",
    pokemon: "pokemon",
    pokemon_color: "pokemon-color",
    pokemon_form: "pokemon-form",
    pokemon_habitat: "pokemon-habitat",
    pokemon_shape: "pokemon-shape",
    pokemon_species: "pokemon-species",
    stat: "stat",
    type: "type",
    language: "language",
  }

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

  @doc """
  Return a paginated list of available resources for that API. By default, a list "page" will contain up to 20 resources.

  ## Parameters

    - **name:** `Atom` [`@resources_list`] that represents the resource from Poke API.
  """
  @impl Behaviour
  def resource(name, limit \\ 20, page \\ 0)
    when is_atom(name) ,
    do: PokeAPI.fetch(@resources_list[name], limit, page)

  @doc """
  Berries are small fruits that can provide HP and status condition restoration, stat enhancement, and even damage negation when eaten by Pokémon. Check out [Bulbapedia](https://bulbapedia.bulbagarden.net/wiki/Berry) for greater detail.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/berry/{id or name}/`
  """
  @impl Behaviour
  def berry(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:berry], id_or_name)

  @doc """
  Berries can be soft or hard. Check out [Bulbapedia](https://bulbapedia.bulbagarden.net/wiki/Category:Berries_by_firmness) for greater detail.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/berry-firmness/{id or name}/`
  """
  @impl Behaviour
  def berry_firmness(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:berry_firmness], id_or_name)

  @doc """
  Flavors determine whether a Pokémon will benefit or suffer from eating a berry based on their nature. Check out [Bulbapedia](https://bulbapedia.bulbagarden.net/wiki/Flavor) for greater detail.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/berry-flavor/{id or name}/`
  """
  @impl Behaviour
  def berry_flavor(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:berry_flavor], id_or_name)

  @doc """
  Contest types are categories judges used to weigh a Pokémon's condition in Pokémon contests. Check out [Bulbapedia](https://bulbapedia.bulbagarden.net/wiki/Contest_condition) for greater detail.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/contest-type/{id or name}/`
  """
  @impl Behaviour
  def contest_type(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:contest_type], id_or_name)

  @doc """
  Contest effects refer to the effects of moves when used in contests.

  ## Parameters

    - **id:** `Integer` that represents the resource identify. `https://pokeapi.co/api/v2/contest-effect/{id}/`
  """
  @impl Behaviour
  def contest_effect(id)
    when is_integer(id),
    do: PokeAPI.fetch(@resources_list[:contest_effect], id)

  @doc """
  Super contest effects refer to the effects of moves when used in super contests.

  ## Parameters

    - **id:** `Integer` that represents the resource identify. `https://pokeapi.co/api/v2/super-contest-effect/{id}/`
  """
  @impl Behaviour
  def super_contest_effect(id)
    when is_integer(id),
    do: PokeAPI.fetch(@resources_list[:super_contest_effect], id)

  @doc """
  Methods by which the player might can encounter Pokémon in the wild, e.g., walking in tall grass. Check out [Bulbapedia](https://bulbapedia.bulbagarden.net/wiki/Wild_Pok%C3%A9mon) for greater detail.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/encounter-method/{id or name}/`
  """
  @impl Behaviour
  def encounter_method(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:encounter_method], id_or_name)

  @doc """
  Conditions which affect what pokemon might appear in the wild, e.g., day or night.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/encounter-condition/{id or name}/`
  """
  @impl Behaviour
  def encounter_condition(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:encounter_condition], id_or_name)

  @doc """
  Encounter condition values are the various states that an encounter condition can have, i.e., time of day can be either day or night.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/encounter-condition-value/{id or name}/`
  """
  @impl Behaviour
  def encounter_condition_value(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:encounter_condition_value], id_or_name)

  @doc """
  Evolution chains are essentially family trees. They start with the lowest stage within a family and detail evolution conditions for each as well as Pokémon they can evolve into up through the hierarchy.

  ## Parameters

    - **id:** `Integer` that represents the resource identify. `https://pokeapi.co/api/v2/evolution-chain/{id}/`
  """
  @impl Behaviour
  def evolution_chain(id)
    when is_integer(id),
    do: PokeAPI.fetch(@resources_list[:evolution_chain], id)

  @doc """
  Evolution triggers are the events and conditions that cause a Pokémon to evolve. Check out [Bulbapedia](https://bulbapedia.bulbagarden.net/wiki/Methods_of_evolution) for greater detail.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/evolution-trigger/{id or name}/`
  """
  @impl Behaviour
  def evolution_trigger(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:evolution_trigger], id_or_name)

  @doc """
  A generation is a grouping of the Pokémon games that separates them based on the Pokémon they include. In each generation, a new set of Pokémon, Moves, Abilities and Types that did not exist in the previous generation are released.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/generation/{id or name}/`
  """
  @impl Behaviour
  def generation(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:generation], id_or_name)

  @doc """
  A Pokédex is a handheld electronic encyclopedia device; one which is capable of recording and retaining information of the various Pokémon in a given region with the exception of the national dex and some smaller dexes related to portions of a region. See [Bulbapedia](https://bulbapedia.bulbagarden.net/wiki/Pok%C3%A9dex) for greater detail.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/pokedex/{id or name}/`
  """
  @impl Behaviour
  def pokedex(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:pokedex], id_or_name)

  @doc """
  Versions of the games, e.g., Red, Blue or Yellow.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/version/{id or name}/`
  """
  @impl Behaviour
  def version(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:version], id_or_name)

  @doc """
  Version groups categorize highly similar versions of the games.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/version-group/{id or name}/`
  """
  @impl Behaviour
  def version_group(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:version_group], id_or_name)

  @doc """
  An item is an object in the games which the player can pick up, keep in their bag, and use in some manner. They have various uses, including healing, powering up, helping catch Pokémon, or to access a new area.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/item/{id or name}/`
  """
  @impl Behaviour
  def item(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:item], id_or_name)

  @doc """
  Item attributes define particular aspects of items, e.g. "usable in battle" or "consumable".

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/item-attribute/{id or name}/`
  """
  @impl Behaviour
  def item_attribute(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:item_attribute], id_or_name)

  @doc """
  Item categories determine where items will be placed in the players bag.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/item-category/{id or name}/`
  """
  @impl Behaviour
  def item_category(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:item_category], id_or_name)

  @doc """
  The various effects of the move "Fling" when used with different items.

  ## Parameters

    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/item-fling-effect/{id or name}/`
  """
  @impl Behaviour
  def item_fling_effect(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:item_fling_effect], id_or_name)

  @doc """
  Pockets within the players bag used for storing items by category.

  ## Parameters
    - **id_or_name:** `Integer` or `String` that represents the resource identify. `https://pokeapi.co/api/v2/item-pocket/{id or name}/`
  """
  @impl Behaviour
  def item_pocket(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:item_pocket], id_or_name)

  @doc """
  Locations that can be visited within the games. Locations make up sizable portions of regions, like cities or routes.

  ## Parameters
    - **id_or_name:** `Integer` or `String` that represents the resource identify.
  """
  @impl Behaviour
  def location(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:location], id_or_name)

  @doc """
  Location areas are sections of areas, such as floors in a building or cave. Each area has its own set of possible Pokémon encounters.

  ## Parameters
    - **id_or_name:** `t:id_or_name/0`
  """
  @impl Behaviour
  def location_area(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:location_area], id_or_name)

  @doc """
  Areas used for grouping Pokémon encounters in Pal Park. They're like habitats that are specific to [Pal Park](https://bulbapedia.bulbagarden.net/wiki/Pal_Park).

  ## Parameters
    - **id_or_name:** `t:id_or_name/0`
  """
  @impl Behaviour
  def pal_park_area(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:pal_park_area], id_or_name)

  @doc """
  A region is an organized area of the Pokémon world. Most often, the main difference between regions is the species of Pokémon that can be encountered within them.

  ## Parameters
    - **id_or_name:** `t:id_or_name/0`
  """
  @impl Behaviour
  def region(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:region], id_or_name)

  @doc """
  Machines are the representation of items that teach moves to Pokémon. They vary from version to version, so it is not certain that one specific TM or HM corresponds to a single Machine.

  ## Parameters

    - **id:** `Integer` that represents the resource identify.
  """
  @impl Behaviour
  def machine(id)
    when is_integer(id),
    do: PokeAPI.fetch(@resources_list[:machine], id)

  @doc """
  Moves are the skills of Pokémon in battle. In battle, a Pokémon uses one move each turn. Some moves (including those learned by Hidden Machine) can be used outside of battle as well, usually for the purpose of removing obstacles or exploring new areas.

  ## Parameters

    - **id_or_name:** `t:id_or_name/0`
  """
  @impl Behaviour
  def move(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:move], id_or_name)

  @doc """
  Move Ailments are status conditions caused by moves used during battle. See [Bulbapedia](https://bulbapedia.bulbagarden.net/wiki/Status_condition) for greater detail.

  ## Parameters

    - **id_or_name:** `t:id_or_name/0`
  """
  @impl Behaviour
  def move_ailment(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:move_ailment], id_or_name)

  @doc """
  Styles of moves when used in the Battle Palace. See [Bulbapedia](http://bulbapedia.bulbagarden.net/wiki/Battle_Frontier_(Generation_III)) for greater detail.

  ## Parameters

    - **id_or_name:** `t:id_or_name/0`
  """
  @impl Behaviour
  def move_battle_style(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:move_battle_style], id_or_name)

  @doc """
  Very general categories that loosely group move effects.

  ## Parameters

    - **id_or_name:** `t:id_or_name/0`
  """
  @impl Behaviour
  def move_category(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:move_category], id_or_name)

  @doc """
  Damage classes moves can have, e.g. physical, special, or non-damaging.

  ## Parameters

    - **id_or_name:** `t:id_or_name/0`
  """
  @impl Behaviour
  def move_damage_class(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:move_damage_class], id_or_name)

  @doc """
  Methods by which Pokémon can learn moves.

  ## Parameters

    - **id_or_name:** `t:id_or_name/0`
  """
  @impl Behaviour
  def move_learn_method(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:move_learn_method], id_or_name)

  @doc """
  Targets moves can be directed at during battle. Targets can be Pokémon, environments or even other moves.

  ## Parameters

    - **id_or_name:** `t:id_or_name/0`
  """
  @impl Behaviour
  def move_target(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:move_target], id_or_name)

  @doc """
  Abilities provide passive effects for Pokémon in battle or in the overworld. Pokémon have multiple possible abilities but can have only one ability at a time. Check out [Bulbapedia](https://bulbapedia.bulbagarden.net/wiki/Ability) for greater detail.

  ## Parameters

    - **id_or_name:** `t:id_or_name/0`
  """
  @impl Behaviour
  def ability(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:ability], id_or_name)

  @doc """
  Characteristics indicate which stat contains a Pokémon's highest IV. A Pokémon's Characteristic is determined by the remainder of its highest IV divided by 5 (gene_modulo). Check out [Bulbapedia](https://bulbapedia.bulbagarden.net/wiki/Characteristic) for greater detail.

  ## Parameters

    - **id:** `Integer` that represents the resource identify.
  """
  @impl Behaviour
  def characteristic(id)
    when is_integer(id),
    do: PokeAPI.fetch(@resources_list[:characteristic], id)

  @doc """
  Egg Groups are categories which determine which Pokémon are able to interbreed. Pokémon may belong to either one or two Egg Groups. Check out [Bulbapedia](https://bulbapedia.bulbagarden.net/wiki/Egg_Group) for greater detail.

  ## Parameters

    - **id_or_name:** `t:id_or_name/0`
  """
  @impl Behaviour
  def egg_group(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:egg_group], id_or_name)

  @doc """
  Genders were introduced in Generation II for the purposes of breeding Pokémon but can also result in visual differences or even different evolutionary lines. Check out [Bulbapedia](https://bulbapedia.bulbagarden.net/wiki/Gender) for greater detail.

  ## Parameters

    - **id_or_name:** `t:id_or_name/0`
  """
  @impl Behaviour
  def gender(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:gender], id_or_name)

  @doc """
  Growth rates are the speed with which Pokémon gain levels through experience. Check out [Bulbapedia](https://bulbapedia.bulbagarden.net/wiki/Experience) for greater detail.

  ## Parameters

    - **id_or_name:** `t:id_or_name/0`
  """
  @impl Behaviour
  def growth_rate(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:growth_rate], id_or_name)

  @doc """
  Natures influence how a Pokémon's stats grow. See [Bulbapedia](https://bulbapedia.bulbagarden.net/wiki/Nature) for greater detail.

  ## Parameters

    - **id_or_name:** `t:id_or_name/0`
  """
  @impl Behaviour
  def nature(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:nature], id_or_name)

  @doc """
  Pokeathlon Stats are different attributes of a Pokémon's performance in Pokéathlons. In Pokéathlons, competitions happen on different courses; one for each of the different Pokéathlon stats. See [Bulbapedia](https://bulbapedia.bulbagarden.net/wiki/Pok%C3%A9athlon) for greater detail.

  ## Parameters

    - **id_or_name:** `t:id_or_name/0`
  """
  @impl Behaviour
  def pokeathlon_stat(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:pokeathlon_stat], id_or_name)

  @doc """
  Pokémon are the creatures that inhabit the world of the Pokémon games. They can be caught using Pokéballs and trained by battling with other Pokémon. Each Pokémon belongs to a specific species but may take on a variant which makes it differ from other Pokémon of the same species, such as base stats, available abilities and typings. See [Bulbapedia](https://bulbapedia.bulbagarden.net/wiki/Pok%C3%A9mon_(species)) for greater detail.

  ## Parameters

    - **id_or_name:** `t:id_or_name/0`
  """
  @impl Behaviour
  def pokemon(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:pokemon], id_or_name)

  @doc """
  Colors used for sorting Pokémon in a Pokédex. The color listed in the Pokédex is usually the color most apparent or covering each Pokémon's body. No orange category exists; Pokémon that are primarily orange are listed as red or brown.

  ## Parameters

    - **id_or_name:** `t:id_or_name/0`
  """
  @impl Behaviour
  def pokemon_color(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:pokemon_color], id_or_name)

  @doc """
  Some Pokémon may appear in one of multiple, visually different forms. These differences are purely cosmetic. For variations within a Pokémon species, which do differ in more than just visuals, the 'Pokémon' entity is used to represent such a variety.

  ## Parameters

    - **id_or_name:** `t:id_or_name/0`
  """
  @impl Behaviour
  def pokemon_form(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:pokemon_form], id_or_name)

  @doc """
  Habitats are generally different terrain Pokémon can be found in but can also be areas designated for rare or legendary Pokémon.

  ## Parameters

    - **id_or_name:** `t:id_or_name/0`
  """
  @impl Behaviour
  def pokemon_habitat(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:pokemon_habitat], id_or_name)

  @doc """
  Shapes used for sorting Pokémon in a Pokédex.

  ## Parameters

    - **id_or_name:** `t:id_or_name/0`
  """
  @impl Behaviour
  def pokemon_shape(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:pokemon_shape], id_or_name)

  @doc """
  A Pokémon Species forms the basis for at least one Pokémon. Attributes of a Pokémon species are shared across all varieties of Pokémon within the species. A good example is Wormadam; Wormadam is the species which can be found in three different varieties, Wormadam-Trash, Wormadam-Sandy and Wormadam-Plant.

  ## Parameters

    - **id_or_name:** `t:id_or_name/0`
  """
  @impl Behaviour
  def pokemon_species(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:pokemon_species], id_or_name)

  @doc """
  Stats determine certain aspects of battles. Each Pokémon has a value for each stat which grows as they gain levels and can be altered momentarily by effects in battles.

  ## Parameters

    - **id_or_name:** `t:id_or_name/0`
  """
  @impl Behaviour
  def stat(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:stat], id_or_name)

  @doc """
  Types are properties for Pokémon and their moves. Each type has three properties: which types of Pokémon it is super effective against, which types of Pokémon it is not very effective against, and which types of Pokémon it is completely ineffective against.

  ## Parameters

    - **id_or_name:** `t:id_or_name/0`
  """
  @impl Behaviour
  def type(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:type], id_or_name)

  @doc """
  Languages for translations of API resource information.

  ## Parameters

    - **id_or_name:** `t:id_or_name/0`
  """
  @impl Behaviour
  def language(id_or_name)
    when is_bitstring(id_or_name) or is_integer(id_or_name),
    do: PokeAPI.fetch(@resources_list[:language], id_or_name)
end
