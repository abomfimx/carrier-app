class TrackOrdersController < ApplicationController
  def index 
    @track_orders = TrackOrder.all
  end

  def new
    @track_order = TrackOrder.new
    @service_orders = ServiceOrder.all
  end

  def create
    @track_order = TrackOrder.new(track_order_params)
    if @track_order.save
      redirect_to track_orders_path, notice: 'Rastreio cadastrado com sucesso'
    else
      @service_orders = ServiceOrder.all
      flash.now[:notice] = 'Rastreio não cadastrado'
      render :new
    end
  end

  def search
    
  end

  private

  def track_order_params
    params.require(:track_order).permit(:tracking_date, :location, :comments, :service_order_id)
  end
end