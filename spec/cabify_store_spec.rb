require 'spec_helper'

describe CabifyStore do
  describe '.default_products' do
    it 'returns the 3 products defined for the Cabify store' do
      product_codes = %w(VOUCHER TSHIRT MUG)
      CabifyStore.default_products.zip(product_codes).each do |product, code|
        expect(code).to eq(product.code)
      end
    end
  end

  describe '.default_pricing_rules' do
    it 'returns the 2 rules defined for the Cabify store' do
      rules = CabifyStore.default_pricing_rules
      expect(rules.size).to eq(2)
      expect(rules[0].is_a? Rules::TwoForOne).to be true
      expect(rules[1].is_a? Rules::Bulk).to be true
    end
  end
end
