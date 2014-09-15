class AddLockTypeToProduct < ActiveRecord::Migration
  def change
    add_column :products, :lock_type, :string
  end
end
