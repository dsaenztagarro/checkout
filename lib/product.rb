# Product is used to represent all kinds of merchandise offered for sale
class Product
  attr_reader :code, :name, :price

  # @param [Hash] opts the options to create a Product
  # @option opts [String] :code
  # @option opts [String] :name
  # @option opts [Price] :price
  # @see Price
  def initialize(args)
    @code = args[:code]
    @name = args[:name]
    @price = args[:price]
  end
end
