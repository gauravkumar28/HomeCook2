class Menu < ActiveRecord::Base
  attr_accessible :name, :price, :category, :location_id, :menu_type
  belongs_to :location
  validates :name, :price, :category, :menu_type, :presence => true
end
