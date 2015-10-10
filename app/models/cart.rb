class Cart < ActiveRecord::Base
  acts_as_shopping_cart_using :cart_item

  def taxes
    0
  end

  def shipping_cost
    (self.subtotal < 50 and self.subtotal > 0) ? 20 : 0
  end
end