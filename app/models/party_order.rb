class PartyOrder < ActiveRecord::Base
  attr_accessible :contact_detail, :name

  validates :name, :contact_detail, :presence => true

  module STATUS
  	REQUESTED = 'requested'
  	CONTACTED = 'contacted'
  end

end
