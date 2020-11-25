class Event < ApplicationRecord
  belongs_to :user
  belongs_to :client
  # after_commit :sync_booking

  # def sync_booking
  #   Booking.create_or_update(self.attributes)
  # end

end
