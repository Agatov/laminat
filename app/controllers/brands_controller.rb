class BrandsController < ApplicationController
  def index
    @brands = Brand.order(:id)
    add_breadcrumb 'Производители'
    set_meta_tags title: 'Производители'
  end

  def products
    @brand = Brand.find params[:id]
    @products = @brand.products

    add_breadcrumb 'Производители', brands_path
    add_breadcrumb @brand.name

  end

  def show

  end
end