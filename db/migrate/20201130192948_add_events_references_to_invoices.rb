class AddEventsReferencesToInvoices < ActiveRecord::Migration[6.0]
  def change
    add_reference :invoices, :event, null: false, foreign_key: true
  end
end
