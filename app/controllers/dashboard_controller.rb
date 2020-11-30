class DashboardController < ApplicationController
  def show
    @todays_events = current_user.events
      .where(start_time: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).order(:start_time)

    @future_events = current_user.events
      .where('start_time >= ?', DateTime.now.tomorrow.beginning_of_day).order(:start_time)

      @future_events_limit_week = current_user.events
      .where('start_time >= ? AND end_time <= ?', DateTime.now.tomorrow.beginning_of_day, DateTime.now.tomorrow.beginning_of_day + 7).order(:start_time)

    @pending_invoices = current_user.events
      .where(payment_status: false)

    @events_weekly_count = current_user.events
      .where(start_time: Time.zone.now.beginning_of_week..Time.zone.now.end_of_week).count

    @events_weekly = current_user.events
      .where(start_time: Time.zone.now.beginning_of_week..Time.zone.now.end_of_week)

    @expenses_weekly = current_user.expenses
      .where(date: DateTime.now.beginning_of_week..DateTime.now.end_of_week)

    @total_expenses_weekly = 0
    @expenses_weekly.each do |expense|
    @total_expenses_weekly += expense.amount
    end

    @income = 0
    @events_weekly.each do |event|
      @income += event.price unless event.price.nil?
    end
  end
end
