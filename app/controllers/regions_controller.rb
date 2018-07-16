class RegionsController < ApplicationController
  before_action :set_region, only: [:show]

  def index
    @regions = Region.all
  end

  def show; end

  def new
    @region = Region.new
  end

  def create
    @region = Region.new(region_params)
    if @region.save
      flash[:success] = 'Região cadastrada com sucesso'
      redirect_to @region
    else
      flash[:alert] = 'Você deve preencher todos os campos'
      render :new
    end
  end

  def search
    @region = Region.find(params[:q][:region])

    if @region.properties.present?
      redirect_to @region
    else
      flash[:alert] = "Região #{@region.name} sem propriedades ainda!" 
      redirect_to @region 
    end
    
  end

  def edit
    id = params[:id]
    @region = Region.find(id)
  end

  def update
    id = params[:id]
    @region = Region.find(id)

    if @region.update(region_params)
      flash[:notice] = 'Região Atualizada com Sucesso'
      redirect_to region_path
    else
      flash[:alert] = 'Campos em branco'
      render 'edit'
    end
  end

  private

  def region_params
    params.require(:region).permit(:name)
  end

  def set_region
    @region = Region.find(params[:id])
  end

end
