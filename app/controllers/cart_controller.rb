class CartController < ApplicationController

  protect_from_forgery :except => [:create, :clear, :remove]


  def show
    @products = Product.find get_cart.products.map {|p| p[:id]}

    add_breadcrumb 'Корзина'
    add_breadcrumb 'Оформление заказаза'
  end

  def create
    @product = Product.find params[:product_id]



    @cart = get_cart
    @cart.add_product @product, params[:count]
    set_cart @cart

    redirect_to :back

    #render partial: 'carts/widget'
  end

  def update
    @product = Product.find params[:product_id]

    @cart = get_cart
    @cart.update_product @product, params[:count]
    set_cart @cart


  end

  def order_form

  end

  def thank

  end


  def clear
    session[:cart] = nil
    #redirect_to :back
    render json: {status: :ok}
  end

  def remove
    @product = Product.find params[:product_id]

    @cart = get_cart
    @cart.remove_product @product
    set_cart @cart

    redirect_to :back

    #render partial: 'carts/widget'
  end
end