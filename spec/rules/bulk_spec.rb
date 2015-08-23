require 'spec_helper'

describe Rules::Bulk do
  let(:basket) { double('Basket', products: products) }
  let(:product) { double('Product', code: 'TSHIRT') }
  let(:price) { Price.new(19) }

  before(:each) do
    @bulk_rule = Rules::Bulk.new(product: product, min_num: 3,
                                 price_per_unit: price)
  end

  describe '#fire_for' do
    context 'basket without the expected product' do
      let(:products) { [] }

      it 'returns nil' do
        expect(@bulk_rule.fire_for(basket)).to eq(nil)
      end
    end

    context 'basket with product not fulfilling bulk conditions' do
      let(:products) { [product] }

      it 'returns nil' do
        expect(@bulk_rule.fire_for(basket)).to eq(nil)
      end
    end

    context 'basket with a bulk purchase for a product' do
      let(:products) { [product, product, product] }

      it 'returns an event' do
        @event = @bulk_rule.fire_for(basket)
        expect(@event.product).to eq(product)
        expect(@event.num_matches).to eq(3)
        expect(@event.new_price).to eq(price)
      end
    end
  end
end
