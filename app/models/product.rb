class Product < ActiveRecord::Base
  belongs_to :brand
  belongs_to :collection

  belongs_to :texture

  mount_uploader :image, ProductImageUploader

  scope :with_price_greater_than, lambda {|price| where('price >= ?', price) unless (price.nil? or price == '')}
  scope :with_price_less_than, lambda {|price| where('price <= ?', price) unless (price.nil? or price == '')}
  scope :with_type, lambda {|type| where(product_type: type) unless (type.nil? or type == '')}



  def full_name
    "#{brand.name} #{collection.name} #{name}"
  end

  def meter_price
    if meters_per_pack and price
      (price / meters_per_pack).ceil
    else
      return 0
    end
  end

  def calculate_price(count)
    price * count
  end

end
