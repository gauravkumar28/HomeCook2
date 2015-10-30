class Cart < ActiveRecord::Base
  acts_as_shopping_cart_using :cart_item
  
  MINIMUM_ORDER_FOR_FREE_SHIPPING = 100
  def taxes
    0
  end

  def shipping_cost
    (self.subtotal <= MINIMUM_ORDER_FOR_FREE_SHIPPING and self.subtotal > 0) ? 20 : 0
  end
end