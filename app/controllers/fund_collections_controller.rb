class FundCollectionsController < ApplicationController
  def index
    @funds = FundCollection.all

    # 🔍 Search (Name / Area)
    if params[:search].present?
      @funds = @funds.where(
        "name ILIKE ? OR area ILIKE ?",
        "%#{params[:search]}%", "%#{params[:search]}%"
      )
    end

    # 🔽 Sorting
    sort_column = params[:sort].presence_in(
      %w[name area amount payment_mode created_at]
    ) || "created_at"

    sort_direction = params[:direction] == "asc" ? "asc" : "desc"

    @funds = @funds.order("#{sort_column} #{sort_direction}")

    # 💰 Total Amount (for dashboard / summary)
    @total_amount = @funds.sum(:amount)

    # 📄 Pagination
    @funds = @funds.page(params[:page]).per(10)

    # 📑 PDF Support
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "fund_collections_report",
               layout: "pdf"
      end
    end
  end

  def new
    @fund = FundCollection.new
  end

  def create
    @fund = FundCollection.new(fund_params)
    if @fund.save
      redirect_to fund_collections_path,
                  notice: "✅ நிதி வெற்றிகரமாக சேமிக்கப்பட்டது"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @fund = FundCollection.find(params[:id])
  end

  def update
    @fund = FundCollection.find(params[:id])
    if @fund.update(fund_params)
      redirect_to fund_collections_path,
                  notice: "✏️ நிதி புதுப்பிக்கப்பட்டது"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @fund = FundCollection.find(params[:id])
    @fund.destroy
    redirect_to fund_collections_path,
                notice: "🗑️ நிதி நீக்கப்பட்டது"
  end

  private

  def fund_params
    params.require(:fund_collection)
          .permit(:name, :area, :amount, :payment_mode)
  end
end
