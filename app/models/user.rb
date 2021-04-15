class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :username, :dealership
  has_many :vehicles
end
