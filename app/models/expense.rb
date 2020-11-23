class Expense < ApplicationRecord
  belongs_to :user

  # validations
  validates :name, presence: true
  validates :date, presence: true
  validates :amount, presence: true
  validates :user, presence: true
end
