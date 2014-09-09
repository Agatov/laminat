class CollectionsController < ApplicationController

  before_filter :find_brand

  def index
    @collections = @brand.collections

    add_breadcrumb 'Производители', brands_path
    add_breadcrumb "Список коллекций #{@brand.name}"
  end

  def products
    @collection = Collection.find params[:id]
    @products = @collection.products

    add_breadcrumb 'Производители', brands_path
    add_breadcrumb "Коллекции #{@brand.name}", brand_collections_path(@brand)
    add_breadcrumb @collection.name, products_brand_collection_path(@brand, @collection)
  end

  def show

  end

  private

  def find_brand
    @brand = Brand.find params[:brand_id]
  end
end