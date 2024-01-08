class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :date, presence: true
end
