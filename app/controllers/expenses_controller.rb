class ExpensesController < ApplicationController
before_action :set_user

  def index
    @income = 0
    @user.bookings.each do |booking|
      @income += booking.price
    end

    @expenses = Expense.all
    @total_expenses = 0
    @expenses.each do |expense|
      @total_expenses += expense.amount
    end

    @profit = @income - @total_expenses
  end

  def new
    @expense = Expense.new(params[:user_id])
  end

  def create
  @expense = Expense.new(expense_params)
  @expense.user = @user
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
