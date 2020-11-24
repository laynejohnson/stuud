class ExpensesController < ApplicationController
before_action :set_user

  def index
    current_user.bookings.each do |booking|
      @income = 0
      @income += booking.price
    end

    @expenses = Expense.all

    @expenses.each do |expense|
      @total_expenses = 0
      @total_expenses += expense.amount
    end

    @profit = @income - @total_expenses
  end

  def new
    @expense = Expense.new(params[:user_id])
  end

  def create
  @expense = Expense.new(expense_params)
  @expense.user = current_user
    if @expense.save
      redirect_to expenses_path
    else
      render :new
    end
  end

private

  def set_user
    @user = current_user
  end

  def expense_params
    params.require(:expense).permit(:date, :amount, :name)
  end

end
