class Bill < ApplicationRecord
  belongs_to :customer, :optional => true
  belongs_to :invoice, :optional => true
  has_one :invoice

  validates :bill_no, presence: true
  validates :amount, presence: true
  validates :due_date, presence: true
  validates :customer_id, presence: true
end
