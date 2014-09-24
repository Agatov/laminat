class AddFacetToProduct < ActiveRecord::Migration
  def change
    add_column :products, :facet, :string
  end
end
