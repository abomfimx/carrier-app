class DeliveryPeriodsController < ApplicationController
  def index   
    @delivery_periods = DeliveryPeriod.all
  end

  def new
    @delivery_period = DeliveryPeriod.new
    @carriers = Carrier.all
  end

  def create
    @delivery_period = DeliveryPeriod.new(delivery_period_params)
    if @delivery_period.save
      redirect_to delivery_periods_path, notice: 'Prazo cadastrado com sucesso'
    else
      @carriers = Carrier.all
      flash.now[:notice] = 'Prazo não cadastrado'
      render :new
    end
  end

  private

  def delivery_period_params
    params.require(:delivery_period).permit(:band_name, :min_distance, :max_distance, :days, :carrier_id)
  end
end