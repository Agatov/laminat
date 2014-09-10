class Admin::ColorsController < AdminController

  before_filter :add_breadcrumbs

  def index
    @colors = Color.order(:id)
    add_breadcrumb 'Colors List'
  end

  def new
    @color = Color.new
  end

  def create
    @color = Color.new color_params

    if @color.save
      redirect_to admin_colors_path
    else
      render :new
    end

  end

  def edit
    @color = Color.find params[:id]
  end

  def update
    @color = Color.find params[:id]

    if @color.update_attributes color_params
      redirect_to admin_colors_path
    else
      render :new
    end
  end

  def destroy

  end

  private

  def color_params
    params.require(:color).permit!
  end

  def add_breadcrumbs

  end
end