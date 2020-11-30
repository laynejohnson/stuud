class AddNotesToClients < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :notes, :text
  end
end
