class Location < ActiveRecord::Base
  # attr_accessible :title, :body
  acts_as_mappable
  belongs_to :chef
end
