class OrdersController < ApplicationController
  def create
    @order = Order.new order_params

    if @order.save
      @order.add_products(session_id)
      recalculate_cart_session
    end

    message = "#{params[:order][:name]}. #{params[:order][:phone]}"
    message += "\n"
    message += I18n.t('panel.order.link', locale: 'ru', id: @order.id.to_s)

    Pony.mail ({
        to: 'abardacha@gmail.com, pol21veka.info@mail.ru',
        subject: I18n.t('project.new-order-title', locale: 'ru'),
        body: message,
        via: :smtp,
        via_options: {
            address: 'smtp.gmail.com',
            port: 587,
            enable_starttls_auto: true,
            user_name: 'pol21veka',
            password: 'qWe123rTy',
            authentication: :plain
        }
    })

    respond_to do |format|
      format.html {redirect_to :back}
      format.json {
        render json: {
            status: :success
        }
      }
    end
  end

  def fast
    message = "#{params[:order][:name]}. #{params[:order][:phone]}"

    Pony.mail ({
        to: 'abardacha@gmail.com, pol21veka.info@mail.ru',
        subject: I18n.t('project.get-call-order', locale: 'ru'),
        body: message,
        via: :smtp,
        via_options: {
            address: 'smtp.gmail.com',
            port: 587,
            enable_starttls_auto: true,
            user_name: 'pol21veka',
            password: 'qWe123rTy',
            authentication: :plain
        }
    })

    render json: {status: :ok}
  end


  private

  def order_params
    params.require(:order).permit!
  end
end