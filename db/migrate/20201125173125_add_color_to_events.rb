class AddColorToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :color, :string
  end
end
