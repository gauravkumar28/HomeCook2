class Order < ActiveRecord::Base
  attr_accessible :address1, :address2, :phone, :landmark, :location_id, :user_id, :status, :time, :summery, :price
  belongs_to :user
  belongs_to :location

  validates :phone, :phone_number => {:ten_digits => true, :format => /\d{10}/, :message => "Phone Number Should be 10 Digit Long"}

  module STATUS
  	PLACED = 'placed'
  	CANCELLED = 'cancelled'
    DELIVERED = 'delivered'
  end
  scope :placed, where(status: STATUS::PLACED)
  scope :cancelled, where(status: STATUS::CANCELLED)

  DELIVERY_CHARGE = 20
  ADMIN_CONTACT_NUMBER = 9986895741
end
