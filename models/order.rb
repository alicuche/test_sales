require_relative '../helpers/number'

class Order
  attr_accessor :order_details

  def initialize(agrs)
    self.order_details = agrs[:order_details]
  end

  def taxes
    order_details.inject(0){ |sum, order_detail| order_detail.taxes + sum }
  end

  def prices
    order_details.inject(0){ |sum, order_detail| order_detail.prices + sum }
  end

  def total
    taxes + prices
  end

  def to_csv
    csv = @order_details.map(&:to_csv).join("\n")
    csv << "\n\n"
    csv << "Sales Taxes: #{NumberHelper::format(taxes)}\n"
    csv << "Total: #{NumberHelper::format(total)}"
  end
end
