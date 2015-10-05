class ShippingAddress < ActiveRecord::Base
  attr_accessible :city, :state, :zip, :addrss1, :address2

  belongs_to :order
end
