class ProductsController < ApplicationController
  def index
    @products = Product.order(:id)
  end

  def by_parameters
    @products = Product
                  .with_price_greater_than(params[:min_price])
                  .with_price_less_than(params[:max_price])
                  .with_type(params[:type])
                  .order(:id)


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