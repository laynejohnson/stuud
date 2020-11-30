class FinancesController < ApplicationController

  def show
    @overdue_invoices = current_user.events.where("end_time <= ?", Date.today - 7)

    @pending_invoices = current_user.events
      .where(payment_status:false)

    @paid_invoices = current_user.events
      .where(payment_status:true)

    @events_weekly = current_user.events
      .where(start_time: Time.zone.now.beginning_of_week..Time.zone.now.end_of_week)

    @events_monthly = current_user.events
      .where(start_time: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month)

    @events_yearly = current_user.events
      .where(start_time: Time.zone.now.beginning_of_year..Time.zone.now.end_of_year)

      # Weekly expenses
    expenses_weekly =  current_user.expenses
      .where(date: Time.zone.now.beginning_of_week..Time.zone.now.end_of_week)

    expenses_monthly =  current_user.expenses
      .where(date: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month)

    if params[:my_finances] == "week"
      @total_expenses = 0
      expenses_weekly.each do |expense|
        @total_expenses += expense.amount
      end

      @income = 0
      @events_weekly.each do |event|
        @income += event.price
      end

    elsif params[:my_finances] == "month"

      expenses = current_user.expenses
      .where(date: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month)

      @total_expenses = 0
      expenses_monthly.each do |expense|
      @total_expenses += expense.amount
      end

      @income= 0
      @events_monthly.each do |event|
        @income += event.price
      end

    else

      expenses = current_user.expenses
        .where(date: Time.zone.now.beginning_of_year..Time.zone.now.end_of_year)

      @total_expenses = 0
      expenses.each do |expense|
      @total_expenses += expense.amount
      end

      @income = 0
      @events_yearly.each do |event|
        @income += event.price
      end
    end

  end
end
