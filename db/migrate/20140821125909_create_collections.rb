class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.integer :brand_id
      t.string :name
      t.string :logo
      t.text :about
      t.string :country
      t.integer :rank
      t.string :sizes
      t.integer :products_count, default: 0

      t.timestamps
    end
  end
end
