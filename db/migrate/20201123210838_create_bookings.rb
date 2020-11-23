class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.datetime :date
      t.integer :length
      t.integer :price
      t.boolean :payment_status, default: nil
      t.boolean :status, default: nil
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
