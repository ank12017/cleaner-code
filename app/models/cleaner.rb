class Cleaner < ActiveRecord::Base
	has_many :cleaner_cities
	has_many :cities, through: :cleaner_cities
	has_many :bookings
	validates_presence_of :first_name, :last_name, :email
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

	accepts_nested_attributes_for :cleaner_cities, allow_destroy: true, reject_if: :all_blank

	def self.find_cleaner(date, city)
		bookings = Booking.where(date: date)
		cleaners = self.joins(:cities).where(cities: {id: city.id}).where.not(id: bookings.map(&:cleaner_id))
		return cleaners.present? ? cleaners.first : nil
	end

	def full_name
		return "#{first_name} #{last_name}"
	end
end
