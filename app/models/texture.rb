class Texture < ActiveRecord::Base
  has_many :products

  mount_uploader :image, TextureImageUploader
end
