class Brand < ActiveRecord::Base
  has_many :collections
  has_many :products
end
