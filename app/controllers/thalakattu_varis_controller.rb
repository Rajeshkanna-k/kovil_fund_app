class ThalakattuVarisController < ApplicationController
  def index
    @entries = ThalakattuVari
                 .order(created_at: :desc)
                 .page(params[:page])
                 .per(10)
  end

  def new
    @entry = ThalakattuVari.new
  end

  def create
    @entry = ThalakattuVari.new(entry_params)

    if @entry.save
      redirect_to thalakattu_varis_path, notice: "Entry added successfully"
    else
      render :new
    end
  end

  private

  def entry_params
    params.require(:thalakattu_vari)
          .permit(:name, :area, :amount, :payment_mode)
  end
end
