class OrdersController < ApplicationController
  def create
    @order = Order.new order_params

    if @order.save
      @order.add_products(session_id)
      recalculate_cart_session
    end

    respond_to do |format|
      format.html {redirect_to :back}
      format.json {
        render json: {
            status: :success
        }
      }
    end
  end


  private

  def order_params
    params.require(:order).permit!
  end
end