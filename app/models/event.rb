require 'csv'

class Event < ApplicationRecord
  belongs_to :user
  belongs_to :client
  has_one :invoice

  def event_time
    start_time.localtime.strftime("%b %e, %l:%M %p")
  end
end

  # def self.all_with_details
  #   Event.select("events.*, users.first_name, users.last_name, clients.first_name as first_name, clients.last_name as last_name")
  # end

#   def self.to_csv(options = {})
#     CSV.generate(options) do
#  end

  # user = current_user
  # query = SQL<<-
  #   select distinct
  #   events.id as event_id,
  #   events.start_time,
  #   users.first_name || ' ' || users.last_name as userfullname,
  #   clients.first_name || ' ' || clients.last_name as clientfullname,
  #   events.price
  #   from events
  #   join users on users.id = events.user_id
  #   join clients on clients.id = events.client_id
  #   where users.id = #{user}
  #   order by events.id desc
  # >>
  # result = ActiveRecord::Base.connection.execute(query)

