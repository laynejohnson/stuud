class AddEventsKeyToBookings < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :event, null: false, foreign_key: true
  end
end
