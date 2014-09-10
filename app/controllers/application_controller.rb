class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :add_breadcrumbs

  def session_id
    session[:session_id]
  end

  def get_cart
    return session[:cart] if session[:cart]
    Cart.new
  end

  def set_cart(cart)
    session[:cart] = cart
  end

  helper_method :get_cart

  def recalculate_cart_session
    @cart_products = CartProduct.by_session_id(session_id)
    session[:cart_products_count] = @cart_products.count
    session[:cart_products_sum] = @cart_products.map {|cp| cp.price }.sum
  end


  private

  def add_breadcrumbs
    add_breadcrumb 'Главная', root_path
  end
end
