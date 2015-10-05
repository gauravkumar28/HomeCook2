class Order < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :address1, :address2, :phone, :landmark, :location_id
  belongs_to :chef
  belongs_to :user
  has_one :time_frame
  belongs_to :location
  # has_one :shipping_address
  # accepts_nested_attributes_for :shipping_address
end
