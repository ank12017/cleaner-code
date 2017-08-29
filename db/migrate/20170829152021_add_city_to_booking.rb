class AddCityToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :city_id, :integer
  end
end
