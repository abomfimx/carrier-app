class ServiceOrdersController < ApplicationController
  before_action :set_service_order, only: [:edit, :update]

  def index 
    set_references
    @service_orders = ServiceOrder.all
  end

  def new
    @service_order = ServiceOrder.new
    set_references
  end

  def create
    @service_order = ServiceOrder.new(service_order_params)
    if @service_order.save
      redirect_to service_orders_path, notice: 'Ordem de Serviço cadastrada com sucesso'
    else
      set_references
      flash.now[:notice] = 'Ordem de Serviço não cadastrada'
      render :new
    end
  end

  def edit
    set_references
  end
  
  def update
    if @service_order.update(service_order_params)
        redirect_to service_orders_path, notice: 'Order de Serviço atualizado com sucesso'
    else
      set_references
      flash.now[:notice] = 'Não foi possível atualizar a Ordem de Serviço'
      render :edit
    end
  end

  private

  def set_service_order
    @service_order = ServiceOrder.find(params[:id])
  end

  def service_order_params
    params.require(:service_order).permit(:placed_date, :status, :tracking_id, :distance, :carrier_id, :customer_id, :warehouse_id, :vehicule_id, :product_id)
  end

  def set_references
    @carriers = Carrier.all
    @customers = Customer.all
    @warehouses = Warehouse.all
    @vehicules = Vehicule.all
    @products = Product.all
  end
end