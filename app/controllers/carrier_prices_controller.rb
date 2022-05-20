class CarrierPricesController < ApplicationController
  before_action :set_carrier_price, only: [:edit, :update]

  def index 
    @carrier_prices = CarrierPrice.all
  end

  def new
    @carrier_price = CarrierPrice.new
    @carriers = Carrier.all
  end

  def edit
    @carriers = Carrier.all
  end

  def update
    if @carrier_price.update(carrier_price_params)
      redirect_to carrier_prices_path, notice: 'Preço atualizado com sucesso'
    else
      @carriers = Carrier.all
      flash.now[:notice] = 'Não foi possível atualizar o preço'
      render :edit
    end
  end

  def create
    @carrier_price = CarrierPrice.new(carrier_price_params)
    if @carrier_price.save
      redirect_to carrier_prices_path, notice: 'Preço cadastrado com sucesso'
    else
      @carriers = Carrier.all
      flash.now[:notice] = 'Preço não cadastrado'
      render :new
    end
  end

  private

  def set_carrier_price
    @carrier_price = CarrierPrice.find(params[:id])
  end

  def carrier_price_params
    params.require(:carrier_price).permit(:band_name, :min_volume, :max_volume, :min_weight, :max_weight, :price, :carrier_id)
  end
end