class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.float :amount
      t.date :invoice_date
      t.string :invoice_user
      t.references :bill, index: true, foreign_key: true

      t.timestamps
    end
  end
end
