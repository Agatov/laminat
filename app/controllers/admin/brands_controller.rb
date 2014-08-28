class Admin::BrandsController < AdminController

  before_filter :add_breadcrumbs

  def index
    @brands = Brand.order(:id)
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new brand_params

    if @brand.save
      redirect_to admin_brands_path
    else
      render :new
    end
  end

  def edit
    @brand = Brand.find params[:id]
  end

  def update
    @brand = Brand.find params[:id]

    if @brand.update_attributes brand_params
      redirect_to admin_brands_path
    else
      render :edit
    end
  end

  def destroy
    @brand = Brand.find params[:id]
    @brand.destroy
    redirect_to admin_brands_path
  end

  private

  def brand_params
    params.require(:brand).permit(:name, :logo, :about, :country)
  end

  def add_breadcrumbs
    add_breadcrumb 'Brands', admin_brands_path

    case params[:action]

      when 'index'
        add_breadcrumb 'Brands List', admin_brands_path
      when 'new'
        add_breadcrumb 'New Brand', new_admin_brand_path
      when 'edit'
        add_breadcrumb 'Edit Brand', edit_admin_brand_path
    end
  end
end