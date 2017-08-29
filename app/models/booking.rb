class Booking < ActiveRecord::Base
  belongs_to :customer
  belongs_to :cleaner
  belongs_to :city

  validates_presence_of :customer, :city
end
