class Product < ActiveRecord::Base
  belongs_to :brand
  belongs_to :collection

  belongs_to :texture

  mount_uploader :image, ProductImageUploader


  def full_name
    "#{brand.name} #{collection.name} #{name}"
  end
end
