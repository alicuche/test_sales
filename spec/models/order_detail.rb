require_relative '../spec_helper'

describe OrderDetail do
  let(:product){ Product.new(name: 'xxxxx', price: 10.12345, imported: true, free_tax: false) }

  let(:order_detail) do 
    OrderDetail.new(product: product, quantity: -5)
  end
  
  describe '#initialize' do
    it 'agruments is assigned' do
      expect(order_detail.quantity).to eq 5
      expect(order_detail.product).to eq product      
    end
  end

  describe '#taxes' do
    it 'should be equal product taxes * quantity' do
      expect(order_detail.taxes).to eq(product.taxes * order_detail.quantity)
    end
  end

  describe '#prices' do
    it 'should be equal product prices * quantity' do
      expect(order_detail.prices).to eq(product.price * order_detail.quantity)
    end
  end

  describe '#to_csv' do
    it 'should be return string' do
      expect(order_detail.to_csv).to be_instance_of(String)
    end 
  end
  
end
