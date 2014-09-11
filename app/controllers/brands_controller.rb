class BrandsController < ApplicationController
  def index
    @brands = Brand.order(:id)
    add_breadcrumb I18n.t('app.breadcrumbs.brands')
  end

  def products
    @brand = Brand.find params[:id]
    @products = @brand.products

    add_breadcrumb I18n.t('app.breadcrumbs.brands'), brands_path
    add_breadcrumb @brand.name

  end

  def show

  end
end