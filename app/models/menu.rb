class Menu < ActiveRecord::Base
  attr_accessible :name, :price, :type, :category
  belongs_to :chef
end
