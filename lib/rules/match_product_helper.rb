module Rules
  # Helper adding methods for counting products matching a rule
  module MatchProductHelper
    # @param [Basket] basket
    def num_matching_products(basket)
      basket.products.map do |product|
        match(product)
      end.reduce(&:+) || 0
    end

    # @param [Product] product
    # @return [Fixnum] 1 case the product matchs the rule. Otherwise 0
    def match(product)
      (product.code.eql? @product.code) ? 1 : 0
    end
  end
end
