class Customer < ApplicationRecord
  has_many :bills
  has_many :invoices
  validates :name, presence: true
  validates :credit, presence: true
end
