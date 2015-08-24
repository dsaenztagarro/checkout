# The Store class represents the Cabify shop
class Store
  attr_reader :products, :pricing_rules

  def initialize
    @pricing_rules = []
    @products = {}
  end

  # Adds a product to the store
  # @param product [Product]
  def add_product(product)
    @products[product.code] = product
  end

  # Adds a pricing rule to the store
  # @param rule [Object]
  def add_pricing_rule(rule)
    @pricing_rules << rule
  end

  # @param code [String] The code of the product
  # @return [Product] the product with related code
  def find_product(code)
    @products[code]
  end
end
