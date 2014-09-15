class AddNumberPerPackToProduct < ActiveRecord::Migration
  def change
    add_column :products, :number_per_pack, :integer, default: 0
  end
end
