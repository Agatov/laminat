class Admin::CollectionsController < AdminController

  before_filter :find_brand
  before_filter :add_breadcrumbs

  def index
    @collections = @brand.collections
    add_breadcrumb 'Collections List', admin_brand_collections_path(@brand)
  end

  def new
    @collection = @brand.collections.build
    add_breadcrumb 'New Collection', new_admin_brand_collection_path(@brand)
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
    add_breadcrumb 'Edit Collection', edit_admin_brand_collection_path(@brand, @collection)
  end

  def update

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
    params.require(:collection).permit(:name)
  end

  def find_brand
    @brand = Brand.find params[:brand_id]
  end

  def add_breadcrumbs
    add_breadcrumb 'Brands', admin_brands_path
    add_breadcrumb @brand.name
  end
end