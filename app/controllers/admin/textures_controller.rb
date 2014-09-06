class Admin::TexturesController < AdminController

  before_filter :add_breadcrumbs

  def index
    @textures = Texture.order(:id)
    add_breadcrumb 'Texture List'
  end

  def new
    @texture = Texture.new
  end

  def create
    @texture = Texture.new texture_params

    if @texture.save
      redirect_to admin_textures_path
    else
      render :new
    end

  end

  def edit
    @texture = Texture.find params[:id]
  end

  def update
    @texture = Texture.find params[:id]

    if @texture.update_attributes texture_params
      redirect_to admin_textures_path
    else
      render :new
    end
  end

  def destroy

  end

  private

  def texture_params
    params.require(:texture).permit!
  end

  def add_breadcrumbs

  end
end