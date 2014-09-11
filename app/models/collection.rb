class Collection < ActiveRecord::Base

  belongs_to :brand, counter_cache: true
  has_many :products

  mount_uploader :logo, CollectionLogoUploader
end
