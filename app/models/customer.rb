class Customer < ApplicationRecord
  has_many :bills
  has_many :invoices
end
