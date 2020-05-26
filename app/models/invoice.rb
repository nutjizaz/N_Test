class Invoice < ApplicationRecord
  belongs_to :customer, :optional => true 
  belongs_to :bill, :optional => true

  validates :amount, presence: true
  validates :invoice_date, presence: true
  validates :invoice_user, presence: true
  validates :bill_id, presence: true
end
