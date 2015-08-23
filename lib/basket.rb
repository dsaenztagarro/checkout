# Represents the container
class Basket
  attr_reader :products

  # @param [Store] store
  def initialize(store)
    @store = store
    @products = []
  end

  # Adds a product to the basket
  # @param code [String] The code of the product
  # @return [Boolean] Marks whether or not the product has been added to the
  #   basket
  def add(code)
    add!(code) && true
  rescue
    false
  end

  # Adds a product to the basket
  # @param [String] code
  # @return [Product] the product added. Otherwise a ProductInvalid exception
  #   is triggered
  # @see ProductInvalid
  def add!(code)
    product = @store.find_product(code)
    fail 'ProductInvalid' unless product
    @products << product
    product
  end

  # @return [Price] the final amount of money to pay
  def total
    @products.reduce(Price.zero) do |total, product|
      total.sum(product.price)
    end
  end

  # Remove all products from the basket
  def clear
    @products.clear
  end
end
