class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :products, :sale_price, :price_per_meter
  end
end
