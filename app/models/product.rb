class Product < ActiveRecord::Base
  belongs_to :brand
  belongs_to :collection

  belongs_to :texture
  belongs_to :color

  mount_uploader :image, ProductImageUploader

  scope :with_price_greater_than, lambda {|price| where('price >= ?', price) unless (price.nil? or price == '')}
  scope :with_price_less_than, lambda {|price| where('price <= ?', price) unless (price.nil? or price == '')}
  scope :with_type, lambda {|type| where(product_type: type) unless (type.nil? or type == '')}
  scope :with_texture_id, lambda {|texture_id| where(texture_id: texture_id) unless (texture_id.nil? or texture_id == '')}
  scope :with_color_id, lambda {|color_id| where(color_id: color_id) unless (color_id.nil? or color_id == '')}

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
