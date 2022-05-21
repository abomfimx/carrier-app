class QuotationsController < ApplicationController
  def index 
    @quotations = Quotation.all
  end

  def new
    @quotation = Quotation.new
    @carriers = Carrier.all
  end

  def create
    @quotation = Quotation.new(quotation_params)
    if @quotation.save
      redirect_to quotations_path, notice: 'Orçamento cadastrado com sucesso'
    else
      @carriers = Carrier.all
      flash.now[:notice] = 'Orçamento não cadastrado'
      render :new
    end
  end

  private

  def quotation_params
    params.require(:quotation).permit(:quotation_date, :delivery_date, :weight, :height, :width, :depth,:distance,:shipping_price, :carrier_id)
  end
end