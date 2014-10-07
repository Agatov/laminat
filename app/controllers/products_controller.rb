class ProductsController < ApplicationController
  def index
    #@products = Product.order(:id)

    # Протестировать перед деплоем
    @products = Product.where(display_on_main_page: true).order(:id)
  end

  def by_parameters
    # @todo - добавить Kaminari
    @products = Product
                  .with_price_greater_than(params[:min_price])
                  .with_price_less_than(params[:max_price])
                  .with_type(params[:type])
                  .with_texture_id(params[:texture_id])
                  .with_color_id(params[:color_id])
                  .order(:id).limit(20)


    #add_breadcrumb 'Выбор ламината по параметрам'
  end

  def by_article
    @products = Product.where(article: params[:article])
  end

  def show
    @product = Product.find params[:id]
    -#@last_viewed_products = Product.find last_viewed_products.uniq.last(8)

    #last_viewed_products << @product.id

    add_breadcrumb I18n.t('app.breadcrumbs.brands'), brands_path
    add_breadcrumb I18n.t('app.breadcrumbs.collections_list', brand_name: @product.brand.name), brand_collections_path(@product.brand)
    add_breadcrumb I18n.t('app.breadcrumbs.collection_name', name: @product.collection.name), products_brand_collection_path(@product.brand, @product.collection)
    add_breadcrumb @product.name
  end
end