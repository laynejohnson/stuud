class Event < ApplicationRecord
  belongs_to :user
  belongs_to :client
  has_many :invoice, dependent: :destroy

  def event_time
    start_time.localtime.strftime("%b %e, %l:%M %p")
  end
  # has_one :booking, dependent: :destroy
  # after_commit :sync_booking, on: [:create, :update]

  # def sync_booking
  #   originalbooking = Booking.find_by(event_id: self.id)
  #   if originalbooking.present?
  #     booking = Booking.new(self.attributes)
  #     booking.id = originalbooking.id
  #     booking.event_id = self.id
  #     booking.save
  #   else
  #     booking = Booking.new(self.attributes)
  #     booking.event_id = self.id
  #     booking.save
  #   end
  # end

end
