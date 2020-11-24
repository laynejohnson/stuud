class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :client

  # validations
  validates :date, presence: true
  validates :length, presence: true
  validates :price, presence: true
  validates :user, presence: true
  validates :client, presence: true

end
