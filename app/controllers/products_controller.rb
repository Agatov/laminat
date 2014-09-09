class ProductsController < ApplicationController
  def index
    @products = Product.order(:id)
  end

  def by_parameters
    @products = Product.order(:id)
    add_breadcrumb 'Выбор ламината по параметрам'
  end

  def show
    @product = Product.find params[:id]

    add_breadcrumb 'Производители', brands_path
    add_breadcrumb "Коллекции #{@product.brand.name}", brand_collections_path(@product.brand)
    add_breadcrumb @product.collection.name, products_brand_collection_path(@product.brand, @product.collection)
    add_breadcrumb @product.name
  end
end