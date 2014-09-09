class CreateCartProducts < ActiveRecord::Migration
  def change
    create_table :cart_products do |t|
      t.string :session_id
      t.integer :product_id
      t.integer :count
      t.integer :price

      t.timestamps
    end
  end
end
