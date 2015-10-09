class Coupan < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :code, :discount_type, :discount, :exppires_at

  validates :code, :discount_type, :discount, :exppires_at, :presence => true
end
