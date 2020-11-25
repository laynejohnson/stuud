class AddPaymentStatusToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :payment_status, :boolean
  end
end
