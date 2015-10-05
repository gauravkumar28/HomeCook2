class Location < ActiveRecord::Base
  attr_accessible :name
  acts_as_mappable
  belongs_to :chef
end
