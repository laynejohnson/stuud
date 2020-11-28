class FinancesController < ApplicationController

  def show
  @pending_invoices = current_user.events
    .where(payment_status:false)

  @paid_invoices = current_user.events
    .where(payment_status:true)

  @bookings_weekly = current_user.events
    .where(start_time: Time.zone.now.beginning_of_week..Time.zone.now.end_of_week)

  @bookings_monthly = current_user.events
    .where(start_time: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month)

  @bookings_yearly = current_user.events
    .where(start_time: Time.zone.now.beginning_of_year..Time.zone.now.end_of_year)


    # Weakly expenses
  expenses_weekly =  current_user.expenses
      .where(date: Time.zone.now.beginning_of_week..Time.zone.now.end_of_week)

    @total_expenses_weekly = 0
    expenses_weekly.each do |expense|
    @total_expenses_weekly += expense.amount
    end

    @income_weakly = 0
    @bookings_weekly.each do |booking|
      # raise
      p booking
      @income_weakly += booking.price
    end

    # Monthly expenses

    expenses_monthly =  current_user.expenses
      .where(date: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month)

    @total_expenses_monthly = 0
    expenses_monthly.each do |expense|
    @total_expenses_monthly += expense.amount
    end

    @income_monthly = 0
    @bookings_monthly.each do |booking|
      @income_monthly += booking.price
    end

    # Yearly

    expenses_yearly =  current_user.expenses
      .where(date: Time.zone.now.beginning_of_year..Time.zone.now.end_of_year)

    @total_expenses_yearly = 0
    expenses_yearly.each do |expense|
    @total_expenses_yearly += expense.amount
    end

    @income_yearly = 0
    @bookings_yearly.each do |booking|
      @income_yearly += booking.price
    end
  end
end
