# The Checkout class represents the main program class
class Checkout
  # @param engine [Engine] The rule engine that fires pricing rules
  # @param basket [Basket] The container for products purchased. Verify that the
  #   products scanned are valid
  def initialize(engine, basket)
    @engine = engine
    @basket = basket
  end

  # Adds item to basket
  # @param code [String] The product code
  # @return [Boolean] Marks whether or not the product code was added
  #   successfully to the basket
  def scan(code)
    @basket.add(code)
  end

  # @return [String] the total price of the purchase after applying discounts
  def total
    @basket.total.deduct(@engine.execute(@basket).as_discount).to_s
  end

  # Remove all items from basket
  def clear
    @basket.clear
  end
end
