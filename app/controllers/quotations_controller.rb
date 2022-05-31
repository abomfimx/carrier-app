class QuotationsController < ApplicationController
  def index 
    @quotations = Quotation.order(:quotation_date)
  end

  def new
    @quotation = Quotation.new
    @carriers = Carrier.all
  end

  def show
    @quotation = Quotation.find(params[:id])
    @quotation_details = QuotationDetail.where("quotation_id = ?", params[:id])
    @count_detail = QuotationDetail.where("quotation_id = ?", params[:id]).count
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
    params.require(:quotation).permit(:quotation_date, :weight, :height, :width, :depth,:distance, :quotation_code)
  end
end