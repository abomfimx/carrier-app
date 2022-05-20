class VehiculesController < ApplicationController
  def index 
    @vehicules = Vehicule.all
  end

  def show
    @vehicule = Vehicule.find(params[:id])
  end

  def new
    @vehicule = Vehicule.new
    @carriers = Carrier.all
  end

  def create
    @vehicule = Vehicule.new(vehicule_params)
    if @vehicule.save
      redirect_to @vehicule, notice: 'Veículo cadastrado com sucesso'
    else
      @carriers = Carrier.all
      flash.now[:notice] = 'Veículo não cadastrado'
      render :new
    end
  end

  private

  def vehicule_params
    params.require(:vehicule).permit(:plate_number, :brand_name, :vehicle_model, :year, :max_load, :carrier_id)
  end
end