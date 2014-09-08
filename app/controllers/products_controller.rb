class ProductsController < ApplicationController
  def index
    @products = Product.order(:id)
  end

  def by_parameters
    @products = Product.order(:id)
  end

  def show
    @product = Product.find params[:id]
  end
end