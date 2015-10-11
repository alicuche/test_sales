require_relative '../spec_helper'

describe Product do
  let(:product_1){ Product.new(name: 'xxxxx', price: 10.12345, imported: true, free_tax: true) }
  let(:product_2){ Product.new(name: 'yyyyy', price: 15.98765, imported: false, free_tax: false) }
  
  describe '#initialize' do
    it 'agruments is assigned' do
      expect(product_1.name).to eq 'xxxxx'
      expect(product_1.price).to eq NumberHelper::format(10.12345)
      expect(product_1.imported).to eq true
      expect(product_1.free_tax).to eq true

      expect(product_2.name).to eq 'yyyyy'
      expect(product_2.price).to eq NumberHelper::format(15.98765)
      expect(product_2.imported).to eq false
      expect(product_2.free_tax).to eq false     
    end
  end

  describe '#basic_tax' do
    it 'free_tax is true' do
      expect(product_1.basic_tax).to eq 0
    end

    it 'free_tax is false' do
      expect(product_2.basic_tax).to eq product_2.price*Product::BASIC_TAX/100
    end
  end

  describe '#additional_tax' do
    it 'imported is true' do
      expect(product_1.additional_tax).to eq product_1.price*Product::ADDITIONAL_TAX/100
    end

    it 'imported is false' do
      expect(product_2.additional_tax).to eq 0
    end
  end

  describe '#taxes' do
    it 'should be equal basic_tax + additional_tax' do
      basic_tax = NumberHelper::format(product_1.basic_tax)
      additional_tax = NumberHelper::format(product_1.additional_tax)
      expect(product_1.taxes).to eq(basic_tax + additional_tax)
    end
  end 
end
