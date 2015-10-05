class Menu < ActiveRecord::Base
  attr_accessible :name, :price, :category, :location_id, :menu_type
  belongs_to :location
end
