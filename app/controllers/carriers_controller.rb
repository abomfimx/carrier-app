class CarriersController < ApplicationController
  before_action :set_carrier, only: [:show]
  def index 
    @carriers = Carrier.all
  end

  def show; end

  def new
    @carrier = Carrier.new
  end

  def create 
    @carrier = Carrier.new(carrier_params)
    if @carrier.save
      redirect_to carrier_path(@carrier), notice: 'Transportadora cadastrada com sucesso'
    else
      flash.now[:notice] = 'Não foi possível cadastrar a transportadora'
      render :new
    end
  end

  private

  def set_carrier
    @carrier = Carrier.find(params[:id])
  end

  def carrier_params
    params.require(:carrier).permit(:brand_name, :corporate_name, :domain_name, :active_state, :registration_number, :address,
                                    :city, :state)
  end
end