require_relative '../spec_helper'

describe Order do
  before do
    @product1 = Product.new(name: 'xxxxx', price: 11.12345, imported: true, free_tax: true)
    @product2 = Product.new(name: 'yyyyy', price: 12.12345, imported: false, free_tax: true)
    @product3 = Product.new(name: 'zzzzz', price: 13.12345, imported: false, free_tax: false)
    
    @order_detail_1 = OrderDetail.new(quantity: 5, product: @product1)
    @order_detail_2 = OrderDetail.new(quantity: 6, product: @product2)
    @order_detail_3 = OrderDetail.new(quantity: 7, product: @product3)

    @order = Order.new(order_details: [@order_detail_1, @order_detail_2, @order_detail_3])

    @sum_taxes = [@order_detail_1.taxes, @order_detail_2.taxes, @order_detail_3.taxes].inject(:+)
    @sum_prices = [@order_detail_1.prices, @order_detail_2.prices, @order_detail_3.prices].inject(:+)
  end

  describe '#initialize' do
    it 'agruments is assigned' do
      expect(@order.order_details).to match_array([
        @order_detail_1, 
        @order_detail_2, 
        @order_detail_3
      ])
    end
  end

  describe '#taxes' do
    it "should be equal total of product's taxe" do
      expect(@order.taxes).to eq @sum_taxes
    end
  end
 
  describe '#prices' do
    it "should be equal total of product's price" do
      expect(@order.prices).to eq @sum_prices
    end
  end

  describe '#total' do
    it 'should be equal #taxes + #prices' do
      expect(@order.total).to eq(@sum_taxes + @sum_prices)
    end
  end

  describe '#to_csv' do
    it 'should be return a string' do
      expect(@order.to_csv).to be_instance_of(String)
    end
  end

end
