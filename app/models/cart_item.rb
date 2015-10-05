class CartItem < ActiveRecord::Base
  acts_as_shopping_cart_item_for :cart
  attr_accessible :owner_id, :owner_type, :quantity, :item_id, :item_type, :price, :item
end