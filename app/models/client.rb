class Client < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :events, dependent: :destroy

  # validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :color, inclusion: { in: %w[Yellow Blue Red]}

  def fullname
    first_name.capitalize + " " + last_name.capitalize
  end
end
