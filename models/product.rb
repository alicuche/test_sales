require_relative '../helpers/number'

class Product
  # Attributes @name, @price, @imported, @free_tax
  # @name product name
  # @price product price
  # @imported product is imported, imported goods at a rate of 5%
  # @free_tax product is free tax, else rate of 10%
	attr_reader :price
	attr_accessor :name, :imported, :free_tax

  BASIC_TAX = 10
  ADDITIONAL_TAX = 5

  def initialize(agrs)
    self.name = agrs[:name]
    self.price = agrs[:price]
    self.imported = agrs[:imported]
    self.free_tax = agrs[:free_tax]
  end

  def price=(price)
    @price = NumberHelper::format(price)
  end

  def basic_tax
    @free_tax ? 0 : @price*BASIC_TAX/100
  end

  def additional_tax
    @imported ? @price*ADDITIONAL_TAX/100 : 0
  end

  def taxes
    NumberHelper::format(basic_tax) + NumberHelper::format(additional_tax)
  end
end
