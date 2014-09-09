class Cart

  attr_accessor :count, :summ, :products

  def initialize
    self.count = 0
    self.summ = 0
    self.products = []
  end


  def add_product(product, count = 1)
    product_hash = {id: product.id, count: count.to_i}
    similar_product = products.find { |p| p[:id] == product.id }

    if similar_product
      similar_product[:count] += count.to_i
      self.summ += product.calculate_price(count.to_i)
    else
      self.products << product_hash
      self.count += 1
      self.summ += product.calculate_price(count.to_i)
    end
  end



  def update_product(product, count)
    product_hash = find_product(product)
    if product_hash
      product_hash[:count] = count
    end
  end

  def remove_product(product)
    similar_product = self.products.find { |p| p[:id] == product.id}
    self.products = self.products - [similar_product]
    self.count -= 1

    self.summ -= product.calculate_price(similar_product[:count])
  end

  def find_product(product)
    products.find { |p| p[:id] == product.id}
  end

end