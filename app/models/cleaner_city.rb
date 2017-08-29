class CleanerCity < ActiveRecord::Base
	belongs_to :city
	belongs_to :cleaner
	has_many :bookings
end
