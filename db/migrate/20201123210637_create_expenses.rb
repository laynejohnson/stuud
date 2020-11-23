class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.datetime :date
      t.integer :amount
      t.string :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
