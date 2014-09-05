class Product < ActiveRecord::Base
  belongs_to :brand
  belongs_to :collection

  belongs_to :texture

  mount_uploader :image, ProductImageUploader
end
