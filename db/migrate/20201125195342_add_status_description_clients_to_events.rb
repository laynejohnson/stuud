class AddStatusDescriptionClientsToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :status, :boolean
    add_column :events, :description, :text
    add_reference :events, :client, null: false, foreign_key: true
  end
end
