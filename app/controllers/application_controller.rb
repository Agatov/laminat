class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :add_breadcrumbs
  before_filter :set_cache_buster

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

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
    cart_products = CartProduct.where(deferred: 0).by_session_id(session_id)
    session[:cart_products_count] = cart_products.count
    session[:cart_products_sum] = cart_products.map {|cp| cp.price }.sum

    deferred_products = CartProduct.where(deferred: true).by_session_id(session_id)

    session[:deferred_products_count] = deferred_products.count
    session[:deferred_products_ids] = deferred_products.map {|dp| dp.product.id}
  end


  private

  def add_breadcrumbs
    add_breadcrumb I18n.t('app.breadcrumbs.main_page'), root_path
  end
end
