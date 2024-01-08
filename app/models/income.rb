class Income < ApplicationRecord
  belongs_to :user

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :source, presence: true
  validates :date, presence: true
  validates :frequency, presence: true
end
