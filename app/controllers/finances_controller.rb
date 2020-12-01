class FinancesController < ApplicationController
before_action :set_user


  def show
    @income = 0

    @user.events.each do |booking|
      @income += booking.price unless booking.price.nil?
    end

    @expenses = Expense.where(user_id: @user).order(:date)

    @total_expenses = 0
    @expenses.each do |expense|
      @total_expenses += expense.amount
    end

    @profit = @income - @total_expenses

    @overdue_invoices = current_user.events.where("end_time <= ?", Date.today - 7)

    @pending_invoices = current_user.events
      .where(payment_status:false)

    @paid_invoices = current_user.events
      .where(payment_status:true)

    @paid_invoices_total = 0
    @paid_invoices.each do |paid|
      @paid_invoices_total += paid.price
    end

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

    @expenses_yearly = current_user.expenses
      .where(date: Time.zone.now.beginning_of_year..Time.zone.now.end_of_year)


# GRAPH DISPLAY LOGIC

    if params[:my_finances] == "week"

      @income = 0
      @events_weekly.each do |event|
        @income += event.price
      end

      @total_expenses = 0
      expenses_weekly.each do |expense|
        @total_expenses += expense.amount
      end

      @profit = @income - @total_expenses

    elsif params[:my_finances] == "month"

      @income= 0
      @events_monthly.each do |event|
        @income += event.price
      end

      expenses = current_user.expenses
      .where(date: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month)

      @total_expenses = 0
      expenses_monthly.each do |expense|
      @total_expenses += expense.amount
      end

      @profit = @income - @total_expenses

    else

      @income = 0
      @events_yearly.each do |event|
        @income += event.price
      end

      expenses = current_user.expenses
        .where(date: Time.zone.now.beginning_of_year..Time.zone.now.end_of_year)

      @total_expenses = 0
      expenses.each do |expense|
      @total_expenses += expense.amount
      end

      @profit = @income - @total_expenses

    end
  end

private

  def set_user
    @user = current_user
  end
end
