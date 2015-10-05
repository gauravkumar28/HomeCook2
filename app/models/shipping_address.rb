class ShippingAddress < ActiveRecord::Base
  attr_accessible :addrss1, :address2, :user_id, :landmark, :phone
  belongs_to :user
end
