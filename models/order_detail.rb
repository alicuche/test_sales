require_relative '../helpers/number'

class OrderDetail
  attr_reader :quantity
  attr_accessor :product

  def initialize(agrs)
    self.quantity = agrs[:quantity]
    self.product = agrs[:product]
  end

  def quantity=(quantity)
    @quantity = quantity.to_i.abs
  end

  def taxes
    @product.taxes * @quantity
  end

  def prices
    @product.price * @quantity
  end

  def to_csv
    "#{@quantity}, #{@product.name}, #{NumberHelper::format(@product.price + @product.taxes)}"
  end
end
