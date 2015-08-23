require 'spec_helper'

describe Price do
  describe '.zero' do
    it 'returns price 0€' do
      expect(Price.zero.value).to eq(0)
    end
  end

  describe '.build' do
    it 'returns a valid price from string' do
      expect(Price.build('2.35€').value).to eq(2.35)
    end
  end

  describe '#sum' do
    it 'sums successfuly prices' do
      result = Price.new(5.25).sum(Price.new(1.12))
      expect(result.value).to eq(Price.new(6.37).value)
    end
  end

  describe '#deduct' do
    it 'deducts successfuly prices' do
      result = Price.new(5.25).deduct(Price.new(1.12))
      expect(result.value).to eq(Price.new(4.13).value)
    end
  end

  describe 'to_s' do
    it "returns price 0€ as '0.00€'" do
      expect(Price.new(0).to_s).to eq('0.00€')
    end

    it "returns price 5€ as '5.00€'" do
      expect(Price.new(5).to_s).to eq('5.00€')
    end

    it "returns price 7.5€ as '7.50€'" do
      expect(Price.new(7.5).to_s).to eq('7.50€')
    end

    it "returns price 10.25€ as '10.25€'" do
      expect(Price.new(10.25).to_s).to eq('10.25€')
    end

    it "returns price 12.437€ as '12.44€' (rounded)" do
      expect(Price.new(12.437).to_s).to eq('12.44€')
    end
  end
end
