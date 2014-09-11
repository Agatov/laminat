class CollectionsController < ApplicationController

  before_filter :find_brand

  def index
    @collections = @brand.collections

    add_breadcrumb I18n.t('app.breadcrumbs.brands'), brands_path

    add_breadcrumb I18n.t('app.breadcrumbs.collections_list', brand_name: @brand.name)
  end

  def products
    @collection = Collection.find params[:id]
    @products = @collection.products

    add_breadcrumb I18n.t('app.breadcrumbs.brands'), brands_path
    add_breadcrumb I18n.t('app.breadcrumbs.collections_list', brand_name: @brand.name), brand_collections_path(@brand)
    add_breadcrumb I18n.t('app.breadcrumbs.collection_name', name: @collection.name), products_brand_collection_path(@brand, @collection)
  end

  def show

  end

  private

  def find_brand
    @brand = Brand.find params[:brand_id]
  end
end