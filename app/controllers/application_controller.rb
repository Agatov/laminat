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


  private

  def add_breadcrumbs
    add_breadcrumb 'Главная', root_path
  end
end
