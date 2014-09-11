class AddDeferredToCartProduct < ActiveRecord::Migration
  def change
    add_column :cart_products, :deferred, :boolean, default: 0
  end
end
