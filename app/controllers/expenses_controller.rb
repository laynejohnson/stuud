class ExpensesController < ApplicationController
before_action :set_user

  def index
    @income = User.bookings.price.all(@user)
    @totalincome = 0

    @income.each { |price| @totalincome += price }



    @expenses = Expense.amount.all(@user)
    @totalexpenses = 0

    @expenses.each { |amount| @totalexpenses += amount }

    @revenue = @totalincome - @totalexpenses

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
