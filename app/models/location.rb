require 'tod'

class Location < ActiveRecord::Base
  attr_accessible :name, :street, :landmark, :city
  acts_as_mappable
  
  has_many :orders
  has_many :time_frames

  validates :name, :presence => true

  def get_available_slots
    available_time = []
    order_available_from = (Time.now.in_time_zone('Mumbai') + 30.minutes).strftime("%H:%M")
    self.time_frames.collect(&:time).each do |time_frame|
      available_time << time_frame if Tod::TimeOfDay.parse(order_available_from) <= Tod::TimeOfDay.parse(time_frame.split("-").first ) 
    end
    available_time
  end
end
