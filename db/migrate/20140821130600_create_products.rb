class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :brand_id
      t.integer :collection_id
      t.integer :color_id
      t.integer :texture_id
      t.string :name
      t.string :article
      t.string :image
      t.integer :price
      t.integer :sale_price
      t.integer :type
      t.integer :length
      t.integer :width
      t.integer :height
      t.integer :weight
      t.integer :volume
      t.integer :lifetime
      t.string :country
      t.text :about

      t.timestamps
    end
  end
end
