class Feedback < ActiveRecord::Base
  attr_accessible :contact_detail, :description, :name

  validates :name, :description, :contact_detail, :presence => true
end
