class CartProductsController < ApplicationController

  protect_from_forgery :except => [:create, :update, :destroy, :clear]

  def index
    @cart_products = CartProduct.by_session_id(session_id)
  end

  def create
    @cart_product = CartProduct.find_by_session_id_and_product_id(session_id, params[:cart_product][:product_id])

    if @cart_product
      @cart_product.count += params[:cart_product][:count].to_i
    else
      @cart_product = CartProduct.new cart_product_params
      @cart_product.session_id = session_id
    end

    @cart_product.save

    recalculate_cart_sessions

    respond_to do |format|
      format.html {redirect_to :back}
      format.json {
        render json: {
          count: session[:cart_products_count],
          sum: session[:cart_products_sum]
        }
      }
    end


  end

  def update
    @cart_product = CartProduct.find params[:id]
    @cart_product.update_attributes cart_product_params

    recalculate_cart_session

    respond_to do |format|
      format.html {redirect_to :back}
      format.json {
        render json: {
          price: @cart_product.price,
          count: session[:cart_products_count],
          sum: session[:cart_products_sum]
        }
      }
    end
  end

  def clear
    recalculate_cart_session
  end

  def destroy
    @cart_product = CartProduct.find params[:id]
    @cart_product.destroy
    recalculate_cart_session
    redirect_to :back
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:product_id, :count)
  end

  def recalculate_cart_session
    @cart_products = CartProduct.by_session_id(session_id)
    session[:cart_products_count] = @cart_products.count
    session[:cart_products_sum] = @cart_products.map {|cp| cp.price }.sum
  end
end