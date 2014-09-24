class AddStampingToProduct < ActiveRecord::Migration
  def change
    add_column :products, :stamping, :string
  end
end
