class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order
 def subtotal
  item.add_tax_price_without_tax * quantity
 end
end
