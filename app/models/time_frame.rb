class TimeFrame < ActiveRecord::Base
  attr_accessible :location_id, :time
  belongs_to :location
  validates :time, :location_id, :presence => true
end
