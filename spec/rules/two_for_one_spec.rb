require 'spec_helper'

describe Rules::TwoForOne do
  let(:basket) { double('Basket', products: products) }
  let(:product) { double('Product', code: 'TSHIRT') }

  before(:each) do
    @rule = Rules::TwoForOne.new(product)
  end

  describe '#fire_for' do
    context 'basket without the expected product' do
      let(:products) { [] }

      it 'returns nil' do
        expect(@rule.fire_for(basket)).to eq(nil)
      end
    end

    context 'basket with product not fulfilling promo conditions' do
      let(:products) { [product] }

      it 'returns nil' do
        expect(@rule.fire_for(basket)).to eq(nil)
      end
    end

    context 'basket with a 2FOR1 purchase for a product' do
      let(:products) { [product, product] }

      it 'returns an event' do
        event = @rule.fire_for(basket)
        expect(event.product).to eq(product)
        expect(event.num_matches).to eq(1)
        expect(event.new_price.value).to eq(0)
      end
    end

    context 'basket with multiple 2FOR1 purchases for a product' do
      let(:products) { [product, product, product, product] }

      it 'returns an event' do
        event = @rule.fire_for(basket)
        expect(event.product).to eq(product)
        expect(event.num_matches).to eq(2)
        expect(event.new_price.value).to eq(0)
      end
    end

    context 'basket with a 2FOR1 purchase and 3 products' do
      let(:products) { [product, product, product] }

      it 'returns an event' do
        event = @rule.fire_for(basket)
        expect(event.product).to eq(product)
        expect(event.num_matches).to eq(1)
        expect(event.new_price.value).to eq(0)
      end
    end
  end
end
