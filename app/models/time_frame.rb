class TimeFrame < ActiveRecord::Base
  attr_accessible :location_id, :time
  belongs_to :location
  validates :time, :location_id, :presence => true
  validates_uniqueness_of :time, :scope => [:location_id]
end
