class FinancesController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.pdf do
        pdf = WickedPdf.new.pdf_from_html_file(‘/home/ale/code/Stuud/app/views/finances/invoices.pdf.erb’)
        render pdf: "file_name"   # Excluding ".pdf" extension.
      end
    end
  end

  def show

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


    # Weakly expenses
    expenses_weekly =  current_user.expenses
      .where(date: Time.zone.now.beginning_of_week..Time.zone.now.end_of_week)

    @total_expenses_weekly = 0
    expenses_weekly.each do |expense|
    @total_expenses_weekly += expense.amount
    end

    @income_weekly = 0
    @events_weekly.each do |event|
      # raise
      p event
      @income_weekly += event.price
    end

    # Monthly expenses

    expenses_monthly =  current_user.expenses
      .where(date: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month)

    @total_expenses_monthly = 0
    expenses_monthly.each do |expense|
    @total_expenses_monthly += expense.amount
    end

    @income_monthly = 0
    @events_monthly.each do |event|
      @income_monthly += event.price
    end

    # Yearly

    expenses_yearly =  current_user.expenses
      .where(date: Time.zone.now.beginning_of_year..Time.zone.now.end_of_year)

    @total_expenses_yearly = 0
    expenses_yearly.each do |expense|
    @total_expenses_yearly += expense.amount
    end

    @income_yearly = 0
    @events_yearly.each do |event|
      @income_yearly += event.price
    end
  end
end
