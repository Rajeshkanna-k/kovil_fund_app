class DashboardController < ApplicationController
  def index
    @total_fund = FundCollection.sum(:amount)
    @total_expense = Expense.sum(:amount)
    @remaining_fund = @total_fund - @total_expense
  end
end
