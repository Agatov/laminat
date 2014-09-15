class AddDisplayOnMainPageToProduct < ActiveRecord::Migration
  def change
    add_column :products, :display_on_main_page, :boolean, default: 0
  end
end
