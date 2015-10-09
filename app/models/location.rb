class Location < ActiveRecord::Base
  attr_accessible :name, :street, :landmark, :city
  acts_as_mappable
  
  has_many :menus
  has_many :orders
  has_many :time_frames
end
