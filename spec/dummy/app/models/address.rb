class Address < ApplicationRecord
  validates_presence_of :zipcode, :street, :neighborhood, :city, :state
end
