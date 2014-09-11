class BrandsController < ApplicationController
  def index
    @brands = Brand.order(:id)
    add_breadcrumb 'Brands'
  end

  def products
    @brand = Brand.find params[:id]
    @products = @brand.products

    add_breadcrumb 'Brands', brands_path
    add_breadcrumb @brand.name

  end

  def show

  end
end