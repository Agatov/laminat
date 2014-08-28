class Collection < ActiveRecord::Base

  belongs_to :brand
  has_many :products

  mount_uploader :logo, CollectionLogoUploader
end
