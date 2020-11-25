class AddDateAndLengthAndPriceToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :date, :datetime
    add_column :events, :length, :integer
    add_column :events, :price, :integer
  end
end
