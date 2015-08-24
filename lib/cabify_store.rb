require 'store'

# The CabifyStore class represents a store with the products and pricing rules
# defined for Cabify store
class CabifyStore < Store
  def initialize
    super
    self.class.default_products.each { |product| add_product(product) }
  end

  # @return [Array<Product>] the default products defined for the Cabify store
  def self.default_products
    [Product.new(code: 'VOUCHER', name: 'Cabify Voucher', price: Price.new(5)),
     Product.new(code: 'TSHIRT', name: 'Cabify T-Shirt', price: Price.new(20)),
     Product.new(code: 'MUG', name: 'Cabify Coffee Mug', price: Price.new(7.5))]
  end

  # @return [Array<Hash>] the default pricing rules defined for the Cabify store
  def self.default_pricing_rules
    [Rules::TwoForOne.new(default_products[0]),
     Rules::Bulk.new(product: default_products[1], min_num: 3,
                     price_per_unit: Price.new(19))]
  end
end
