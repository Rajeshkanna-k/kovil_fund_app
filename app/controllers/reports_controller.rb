class ReportsController < ApplicationController
  def kalvettu
    # 🔁 Sorting (default: amount DESC)
    sort_column = %w[amount created_at name].include?(params[:sort]) ? params[:sort] : "amount"
    sort_order  = params[:direction] == "asc" ? "asc" : "desc"

    @funds = FundCollection
               .where("amount >= ?", 5000)
               .order("#{sort_column} #{sort_order}")

    # 📄 Pagination (Kaminari)
    @funds = @funds.page(params[:page]).per(25)

    # 💰 Total amount (without pagination)
    @total_amount = FundCollection
                      .where("amount >= ?", 5000)
                      .sum(:amount)
  end
end
