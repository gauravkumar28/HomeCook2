class TimeFrame < ActiveRecord::Base
  attr_accessible :time, :location_id
  belongs_to :Location

  validates :time, :location_id, :presence => true
end
