class ProductsController < ApplicationController
  def index 
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: 'Produto cadastrado com sucesso'
    else
      flash.now[:notice] = 'Produto não cadastrado'
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :weight, :width, :depth, :height, :sku)
  end
end