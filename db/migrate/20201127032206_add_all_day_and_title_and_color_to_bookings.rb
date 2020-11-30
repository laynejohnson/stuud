class AddAllDayAndTitleAndColorToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :all_day, :boolean
    add_column :bookings, :title, :string
    add_column :bookings, :color, :string
  end
end
