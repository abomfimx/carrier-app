class ServiceOrdersController < ApplicationController
  before_action :authenticate_user!
  # before_action :authenticate_user!, only: [:new, :create, :index] Original
  before_action :set_and_check_service_order, only: [:edit, :update, :show, :delivered, :rejected, :approved ]

  def index 
    set_references
    if current_user.admin
      @serv_orders = ServiceOrder.order(:placed_date)
    else
      # @serv_orders = current_user.carrier.service_orders - Rspec fails with it
      @serv_orders = ServiceOrder.where("carrier_id = ?", current_user.carrier_id).order(:placed_date)
    end
    @serv_orders
  end

  def new
    @service_order = ServiceOrder.new
    set_references
  end

  def show
    # if @service_order.carrier_id != current_user.carrier_id
    #   redirect_to root_path, notice: 'Você não possui acesso a esta ordem'
    # end
  end

  def create
    @service_order = ServiceOrder.new(service_order_params)
    if @service_order.save
      redirect_to service_orders_path, alert: 'Ordem de Serviço cadastrada com sucesso'
    else
      set_references
      flash.now[:notice] = 'Ordem de Serviço não cadastrada'
      render :new
    end
  end

  def edit
    set_references
    unless current_user.admin
      @vehicules = current_user.carrier.vehicules
    end
    # if @service_order.carrier_id != current_user.carrier_id
    #   redirect_to root_path, notice: 'Você não possui acesso a esta ordem'
    # end
  end
  
  def update
    # if @service_order.carrier_id != current_user.carrier_id
    #   return redirect_to root_path, notice: 'Você não possui acesso a esta ordem'
    # end
    if @service_order.update(service_order_params)
        redirect_to service_orders_path, notice: 'Ordem de Serviço atualizada com sucesso'
    else
      set_references
      flash.now[:notice] = 'Não foi possível atualizar a Ordem de Serviço'
      render :edit
    end
  end

  def delivered
    @service_order.delivered!
    redirect_to @service_order
  end

  def rejected
    @service_order.rejected!
    redirect_to @service_order
  end
  
  def approved
    @service_order.approved!
    redirect_to @service_order
  end

  private

  def set_and_check_service_order
    @service_order = ServiceOrder.find(params[:id])
    unless current_user.admin
      if (@service_order.carrier_id != current_user.carrier_id)
        redirect_to root_path, notice: 'Você não possui acesso a esta ordem'
      end
    end
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