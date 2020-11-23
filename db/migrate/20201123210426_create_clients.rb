class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :address
      t.string :color
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
