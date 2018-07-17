class PropertyTypesController < ApplicationController
  before_action :set_property_type, only: [:show]

  def index
    @property_types = PropertyType.all 
  end

  def show; end

  def new
    @property_type = PropertyType.new
  end

  def create
    @property_type = PropertyType.new(property_type_params)
    if @property_type.save
      flash[:success] = 'Tipo do imóvel cadastrado com sucesso'
      redirect_to @property_type
    else
      flash[:alert] = 'Você deve preencher todos os campos'
      render :new
    end
  end

  def edit
    set_property_type
  end

  def update 
    set_property_type

    if @property_type.update(property_type_params)
      flash[:notice] = 'Tipo de imóvel atualizado com sucesso'
      redirect_to property_type_path
    else
      flash[:alert] = 'Campos em branco'
      render 'edit'
    end
  end

  private

  def property_type_params
    params.require(:property_type).permit(:name)
  end

  def set_property_type
    @property_type = PropertyType.find(params[:id])
  end
end
