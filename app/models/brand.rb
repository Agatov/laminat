class Brand < ActiveRecord::Base
  has_many :collections
  has_many :products

  mount_uploader :logo, BrandLogoUploader
end
