class Menu < ActiveRecord::Base
  attr_accessible :name, :price, :category, :location_id, :menu_type
  
  module Type
  	RICE ='rice'
  	GRAVY ='gravy'
  	DRINK ='drink'
  	PRATHA ='paratha'

  	def self.all
  	  [RICE, GRAVY, DRINK, PRATHA]
  	end
  end

  module Category
  	VEG = "veg"
  	NON_VEG = "non-veg"

  	def self.all
  	  [VEG, NON_VEG]
  	end
  end 

  validates :name, :price, :presence => true
  validates :menu_type, :presence => true, inclusion: { in: Type.all }
  validates :category, :presence => true, inclusion: { in: Category.all }

end
