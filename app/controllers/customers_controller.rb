class CustomersController < ApplicationController
  def index 
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create 
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customers_path(@customer), notice: 'Cliente cadastrado com sucesso'
    else
      flash.now[:notice] = 'Não foi possível cadastrar o Cliente'
      render :new
    end
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :address, :city, :state, :cpf, :email)
  end
end