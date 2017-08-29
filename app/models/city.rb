class City < ActiveRecord::Base
	has_many :cleaner_cities
	has_many :bookings

	validates_presence_of :name
end
