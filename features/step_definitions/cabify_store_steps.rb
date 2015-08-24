Given(/^I visit the Cabify store$/) do
  @checkout = Checkout.new(CabifyStore.default_pricing_rules)
end
