class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :phone, :name
  # attr_accessible :title, :body
  has_many :orders
  has_one :shipping_address
  has_many :coupans
  validates :email, :password, :phone, :name, :presence => true
  validates :phone, :phone_number => {:ten_digits => true, :format => /\d{10}/, :message => "Phone Number Should be 10 Digit Long"}
end
