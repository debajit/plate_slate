defmodule PlateSlateWeb.Schema do
  @moduledoc """
  See also

  - https://hexdocs.pm/absinthe/Absinthe.Schema.html
  - https://hexdocs.pm/absinthe/Absinthe.Schema.Notation.html
  """

  import Ecto.Query
  alias PlateSlate.Menu
  alias PlateSlate.Repo
  alias PlateSlate.Resolvers

  use Absinthe.Schema

  query do
    field :menu_items, list_of(:menu_item) do
      arg :matching, :string
      resolve &Resolvers.Menu.menu_items/3
    end
  end

  @desc """
  Tasty thing to eat!
  """
  object :menu_item do          # Creates struct
    field :id, :id              # Ids in GraphQL get serialized as strings.

    @desc "The name of the item"
    field :name, :string        # Creates a field inside the struct
    field :description, :string
    field :price, :float
  end
end
