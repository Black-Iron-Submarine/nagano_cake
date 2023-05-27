class Item < ApplicationRecord
  has_one_attached :image
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre

  def add_tax_price_without_tax
    (self.price_without_tax * 1.10).round
  end
end
