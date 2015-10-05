class TimeFrame < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :order
  belongs_to :chef
end
