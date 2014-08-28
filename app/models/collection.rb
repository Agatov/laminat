class Collection < ActiveRecord::Base

  belongs_to :brand
  has_many :products
end
