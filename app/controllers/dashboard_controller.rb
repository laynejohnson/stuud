class DashboardController < ApplicationController
  def show
    @todays_bookings = current_user.bookings
      .where(date: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)

    @pending_invoices = current_user.bookings
      .where(payment_status:false)

    @bookings_weekly_count = current_user.bookings
      .where(date: Time.zone.now.beginning_of_week..Time.zone.now.end_of_week).count

    @bookings_weekly = current_user.bookings
      .where(date: Time.zone.now.beginning_of_week..Time.zone.now.end_of_week)

    expenses_weekly =  current_user.expenses
      .where(date: Time.zone.now.beginning_of_week..Time.zone.now.end_of_week)

    @total_expenses_weekly = 0
    expenses_weekly.each do |expense|
    @total_expenses_weekly += expense.amount
    end

    @income = 0
    @bookings_weekly.each do |booking|
      @income += booking.price
    end

  end
end
