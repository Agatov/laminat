class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.string :logo
      t.string :country
      t.text :about
      t.text :description
      t.integer :products_count, default: 0
      t.integer :collections_count, default: 0

      t.timestamps
    end
  end
end
