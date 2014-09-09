class AddMetersPerPackToProduct < ActiveRecord::Migration
  def change
    add_column :products, :meters_per_pack, :float
  end
end
