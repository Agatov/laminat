class FixColumnName2 < ActiveRecord::Migration
  def change
    rename_column :products, :volume, :heat_floor
    change_column :products, :heat_floor, :string
  end
end
