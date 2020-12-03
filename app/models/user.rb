class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # user relations and dependencies
  has_many :clients, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :expenses, dependent: :destroy
  has_many :clients, through: :bookings
  has_many :events, dependent: :destroy
  has_many :invoices, dependent: :destroy

  def generate_inc_report
    query = <<-SQL
      select distinct
      events.id as event_id,
      events.start_time,
      users.first_name || ' ' || users.last_name as userfullname,
      clients.first_name || ' ' || clients.last_name as clientfullname,
      events.price
      from events
      join users on users.id = events.user_id
      join clients on clients.id = events.client_id
      where users.id = #{self.id}
      order by events.start_time desc
    SQL
    income_reports = ActiveRecord::Base.connection.execute(query).to_a
  end

  def generate_exp_report
    query = <<-SQL
      select distinct
      expenses.date,
      expenses.name,
      expenses.amount,
      expenses.id
      from expenses
      join users on users.id = expenses.user_id
      where users.id = #{self.id}
      order by expenses.date desc
    SQL
    expenses_reports = ActiveRecord::Base.connection.execute(query).to_a
  end

end
