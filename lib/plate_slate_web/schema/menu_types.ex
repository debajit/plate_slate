defmodule PlateSlateWeb.Schema.MenuTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: PlateSlate.Repo

  input_object :menu_items_filter do
    field :matching, :string
    field :priced_above, :decimal
    field :priced_below, :decimal
  end

  @desc """
  Tasty thing to eat!
  """
  object :menu_item do
    field :id, :id
    @desc "The name of the item"
    field :name, :string
    field :description, :string
    field :price, :float
    field :category, :category, resolve: assoc(:category)

    # field :category, :category do
    #   batch({__MODULE__, :batch_get_categories}, menu_item.category_id, fn batch_results ->
    #     {:ok, Map.get(batch_results, menu_item.category_id)}
    #   end)
    # end
  end

  # def batch_get_categories(_, category_ids) do
  #   import Ecto.Query

  #   PlateSlate.Menu.Category
  #   |> where([c], c.id in ^Enum.uniq(category_ids))
  #   |> Repo.all
  #   |> Map.new(fn category -> {category.id, category} end)
  #   |> IO.inspect
  # end

  object :category do
    field :name, :string
  end
end
