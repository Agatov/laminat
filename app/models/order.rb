class Order < ActiveRecord::Base
  has_many :order_products


  def add_products(session_id)
    cart_products = CartProduct.by_session_id(session_id)

    cart_products.each do |cp|
      cp.generate_order_product(self).save
      cp.destroy
    end
  end
end
