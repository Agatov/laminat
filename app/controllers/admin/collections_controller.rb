class Admin::CollectionsController < AdminController

  before_filter :find_brand
  before_filter :add_breadcrumbs

  def index
    @collections = @brand.collections
    add_breadcrumb @brand.name
    add_breadcrumb I18n.t('admin.breadcrumbs.collections.list'), admin_brand_collections_path(@brand)
  end

  def new
    @collection = @brand.collections.build
    add_breadcrumb @brand.name, admin_brand_collections_path(@brand)
    add_breadcrumb I18n.t('admin.breadcrumbs.collections.new'), new_admin_brand_collection_path(@brand)
  end

  def create
    @collection = @brand.collections.build collection_params

    if @collection.save
      redirect_to admin_brand_collections_path(@brand)
    else
      render :new
    end

  end

  def edit
    @collection = Collection.find params[:id]
    add_breadcrumb @brand.name, admin_brand_collections_path(@brand)
    add_breadcrumb I18n.t('admin.breadcrumbs.collections.edit'), edit_admin_brand_collection_path(@brand, @collection)
  end

  def update
    @collection = Collection.find params[:id]

    if @collection.update_attributes collection_params
      redirect_to admin_brand_collections_path(@brand)
    else
      render :edit
    end
  end

  def destroy
    @collection = Collection.find params[:id]
    @collection.destroy
    redirect_to admin_brand_collections_path(@brand)
  end

  private

  def collection_params
    params.require(:collection).permit!
  end

  def find_brand
    @brand = Brand.find params[:brand_id]
  end

  def add_breadcrumbs
    add_breadcrumb 'Brands', admin_brands_path
  end
end