# Price is used to represent the price of a product.
# Responsible for operations (sum prices of products)
class Price
  # @!attribute [r] value
  #   @return [Float] the price value
  attr_reader :value

  # @param [Float] value
  def initialize(value)
    @value = value.to_f.round(2)
  end

  # @param [Price] price
  # @return [Price]
  def sum(price)
    @value += price.value
    self
  end

  # @param [Price] price
  # @return [Price]
  def deduct(price)
    return self unless price
    @value -= price.value
    (@value > 0) ? self : Price.zero
  end

  def to_s
    return '0.00€' if value == 0
    format('%.2f€', value)
  end

  def self.zero
    Price.new(0)
  end

  # @param [String] price
  def self.build(price)
    Price.new(price.chomp('€').to_f)
  end
end
