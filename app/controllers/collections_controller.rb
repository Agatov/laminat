class CollectionsController < ApplicationController

  before_filter :find_brand

  def index
    @collections = @brand.collections
  end

  def products
    @collection = Collection.find params[:id]
    @products = @collection.products
  end

  def show

  end

  private

  def find_brand
    @brand = Brand.find params[:brand_id]
  end
end