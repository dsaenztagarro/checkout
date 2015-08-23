require 'spec_helper'

describe Store do
  let(:store) { Store.new }
  let(:product) { double('Product', code: 'TSHIRT') }

  describe '#add_product' do
    it 'adds a product to the store' do
      store.add_product(product)
      expect(store.products.key? product.code).to be true
    end
  end

  describe '#add_pricing_rule' do
    it 'adds a pricing rule to the store' do
      rule = double('BulkRule')
      store.add_pricing_rule(rule)
      expect(store.pricing_rules.include? rule).to be true
    end
  end

  describe '#find_product' do
    it 'finds by code a product of the score' do
      store.add_product(product)
      expect(store.find_product(product.code)).to eq(product)
    end

    it "returns nil if it doesn't find the product in the store" do
      expect(store.find_product('unknown')).to eq(nil)
    end
  end
end
