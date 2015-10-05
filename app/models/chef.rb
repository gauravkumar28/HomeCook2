class Chef < ActiveRecord::Base
  # attr_accessible :title, :body

  has_many :offers
  has_many :menus
  has_many :reviews
  has_many :orders
  has_one :location

  attr_accessible :image
  has_attached_file :image, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


  acts_as_mappable :through => :location
end
