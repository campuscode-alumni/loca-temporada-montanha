class PriceRangesController < ApplicationController
  before_action :set_price_range, only: [:show]

  def index
  end

  def new
    @price_range = PriceRange.new
  end

  def create
    @price_range = PriceRange.new(price_range_params)
    if @price_range.save
      flash[:success] = 'Temporada Cadastrada com Sucesso'
      redirect_to @price_range
    else
      flash[:alert] = 'Você deve preencher todos os campos'
      render :new
    end
  end

  def show
    
  end

  private

  def set_price_range
    @price_range = PriceRange.find(params[:id])
  end

  def price_range_params
    params.require(:price_range).permit(:title, :start_date, :end_date, :daily_rate)
  
  end

end