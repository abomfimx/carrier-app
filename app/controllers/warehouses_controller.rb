class WarehousesController < ApplicationController
  def index
    @warehouses = Warehouse.all
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)
    if @warehouse.save
      return redirect_to warehouses_path, notice: 'Depósito cadastrado com sucesso'
    else
      flash.now[:notice] = 'Depósito não cadastrado'
      render :new
    end
  end

  private

  def warehouse_params
    params.require(:warehouse).permit(:name, :address, :city, :state, :code)
  end
end