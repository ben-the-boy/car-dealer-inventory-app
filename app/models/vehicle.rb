class Vehicle < ActiveRecord::Base
  validates_presence_of :brand, :model, :year, :mileage, :style, :color
  belongs_to :user
end
