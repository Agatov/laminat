class AddDeferredToOrderProduct < ActiveRecord::Migration
  def change
    add_column :order_products, :deffered, :boolean, default: 0
  end
end
