class Admin::ProductsController < AdminController

  before_filter :find_brand
  before_filter :find_collection
  before_filter :add_breadcrumbs

  def index
    @products = @collection.products
    add_breadcrumb 'Products List', admin_brand_collection_products_path(@brand, @collection)
  end

  def new
    @product = Product.new(brand: @brand, collection: @collection)
    add_breadcrumb 'New Product', new_admin_brand_collection_product_path(@brand, @collection)
  end

  def create
    @product = Product.new product_params
    @product.brand = @brand
    @product.collection = @collection

    if @product.save
      redirect_to admin_brand_collection_products_path(@brand, @collection)
    else
      render :new
    end
  end

  def edit
    @product = Product.find params[:id]
    add_breadcrumb 'Products List', edit_admin_brand_collection_product_path(@brand, @collection, @product)
  end

  def update
    @product = Product.find params[:id]

    if @product.update_attributes product_params
      redirect_to admin_brand_collection_products_path(@brand, @collection)
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find params[:id]
    @product.destroy
    redirect_to admin_brand_collection_products_path(@brand, @collection)
  end

  private

  def product_params
    params.require(:product).permit!
  end

  def find_brand
    @brand = Brand.find params[:brand_id]
  end

  def find_collection
    @collection = Collection.find params[:collection_id]
  end

  def add_breadcrumbs
    add_breadcrumb 'Brands', admin_brands_path
    add_breadcrumb @brand.name, admin_brand_path(@brand)
    add_breadcrumb @collection.name, admin_brand_collection_path(@brand, @collection)
  end

end