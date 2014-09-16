class Panel::OrdersController < ApplicationController

  layout 'panel'

  def index
    @orders = Order.order('id desc')
  end

  def show
    @order = Order.find params[:id]
  end

  def destroy
  end
end