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

  include PgSearch::Model
  pg_search_scope :search_by_color,
    against: [ :color, :first_name, :last_name, :address, :phone, :email ],
    using: {
      tsearch: { prefix: true }
    }
end
