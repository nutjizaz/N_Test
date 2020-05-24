class CreateBills < ActiveRecord::Migration[6.0]
  def change
    create_table :bills do |t|

      t.string :bill_no
      t.float :amount
      t.date :due_date
      t.references :customer, index: true, foreign_key: true

      t.timestamps
    end
  end
end
