defmodule PlateSlateWeb.Schema.OrderingTypes do
  use Absinthe.Schema.Notation

  object :order do
    field :customer_number, :integer
    field :ordered_at, :datetime
    field :state, :order_state
    field :items, list_of(:order_item)

    # # If we wanted to add a computed field
    # field :total, :decimal do
    #   resolve fn order, _, _ ->
    #     total =
    #       order
    #       |> Ecto.assoc(:items)
    #       |> Enum.reduce(0, fn item, total ->
    #            item.price + total
    #          end)
    #   end
    # end
  end

  object :order_item do
    field :price, :decimal
    field :quantity, :integer
  end

  enum :order_state do
    value :created
    value :completed
  end
end
