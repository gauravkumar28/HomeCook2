class Order < ActiveRecord::Base
  attr_accessible :address1, :address2, :phone, :landmark, :location_id, :user_id, :status, :time, :summery, :price
  belongs_to :user
  belongs_to :location
  module STATUS
  	PLACED = 'placed'
  	CANCELLED = 'cancelled'
  end
  scope :placed, where(status: STATUS::PLACED)
  scope :cancelled, where(status: STATUS::CANCELLED)
end
