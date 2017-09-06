defmodule PlateSlateWeb.Schema do
  @moduledoc """
  See also

  - https://hexdocs.pm/absinthe/Absinthe.Schema.html
  - https://hexdocs.pm/absinthe/Absinthe.Schema.Notation.html
  """

  use Absinthe.Schema

  query do
    field :health, :string
  end

  object :menu_item do          # Creates struct
    field :id, :id              # Ids in GraphQL get serialized as strings.
    field :name, :string        # Creates a field inside the struct
    field :description, :string
  end
end
