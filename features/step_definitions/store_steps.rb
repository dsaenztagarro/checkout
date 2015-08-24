Given(/^a physical store$/) do
  @store = Store.new
end

Given(/^it sells this products:$/) do |table|
  table.symbolic_hashes.each do |args|
    args.merge!(price: Price.build(args[:price]))
    @store.add_product(Product.new(args))
  end
end

Given(/it has 2-for-1 discounts on:$/) do |table|
  table.symbolic_hashes.each do |args|
    product = @store.find_product(args[:code])
    @store.add_pricing_rule(Rules::TwoForOne.new(product))
  end
end

Given(/it has discounts in bulk purchases:$/) do |table|
  table.symbolic_hashes.map do |args|
    @store.add_pricing_rule(
      Rules::Bulk.new(product: @store.find_product(args[:code]),
                      min_num: args[:min_num].to_i,
                      price_per_unit: Price.build(args[:price_per_unit])))
  end
end

Given(/^I visit the store$/) do
  engine = Engine.new(@store) # shopping discount engine
  basket = Basket.new(@store) # shopping basket
  @checkout = Checkout.new(engine, basket)
end
