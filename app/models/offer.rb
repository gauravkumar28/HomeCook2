class Offer < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :chef
end
