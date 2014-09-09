class CartProduct < ActiveRecord::Base
  belongs_to :product


  after_create :calculate_price_and_save
  before_update :calculate_price

  scope :by_session_id, lambda { |session_id| where(session_id: session_id)}

  def calculate_price
    self.price = product.calculate_price(count)
  end

  def calculate_price_and_save
    calculate_price
    save
  end
end