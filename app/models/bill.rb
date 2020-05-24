class Bill < ApplicationRecord
  belongs_to :customer, :optional => true
  belongs_to :invoice, :optional => true
  has_one :invoice
end
