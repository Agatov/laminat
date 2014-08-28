class Admin::CollectionsController < AdminController

  before_filter :find_brand

  def index
    @collections = @brand.collections
  end

  def new
    @collection = @brand.collections.build

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
end