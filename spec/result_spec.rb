require 'spec_helper'

describe Result do
  let(:result) { Result.new(events) }

  describe '#as_discount' do
    context 'no events' do
      let(:events) { [] }

      it 'returns a price 0.00€' do
        expect(result.as_discount.to_s).to eq(Price.zero.to_s)
      end
    end

    context 'one event' do
      let(:price) { Price.new(10) }
      let(:events) { [double('Event', discount: price)] }

      it 'returns the discount for the event' do
        expect(result.as_discount.to_s).to eq(price.to_s)
      end
    end

    context 'multiple events' do
      let(:events) do
        [double('Event', discount: Price.new(1)),
         double('Event', discount: Price.new(5)),
         double('Event', discount: Price.new(10))]
      end

      it 'returns the sum of the discount for the events' do
        expect(result.as_discount.to_s).to eq(Price.new(16).to_s)
      end
    end
  end
end
