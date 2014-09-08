class BrandsController < ApplicationController
  def index
    @brands = Brand.order(:id)
  end

  def products
    @brand = Brand.find params[:id]
    @products = @brand.products
  end

  def show

  end
end