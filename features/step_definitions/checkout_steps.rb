When(/^I purchase the items (.*)$/) do |items|
  items.split(',').map(&:strip).each { |item| @checkout.scan(item) }
end

Then(/^the total price is (.*)$/) do |price|
  expect(@checkout.total).to eq(price)
end
