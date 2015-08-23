require 'spec_helper'

describe Basket do
  let(:basket) { Basket.new(store) }
  let(:product) { double('Product', code: 'TSHIRT') }

  describe '#add' do
    context 'product present in store' do
      let(:store) { double('Store', find_product: product) }

      it 'adds the product to the basket' do
        expect(basket.add(product.code)).to be true
      end
    end

    context 'product not present in store' do
      let(:store) { double('Store', find_product: nil) }

      it "doesn't add the product to the basket" do
        expect(basket.add(product.code)).to be false
      end
    end
  end

  describe '#add!' do
    context 'product present in store' do
      let(:store) { double('Store', find_product: product) }

      it 'adds the product to the basket' do
        expect(basket.add!(product.code)).to be product
      end
    end

    context 'product not present in store' do
      let(:store) { double('Store', find_product: nil) }

      it "doesn't add the product to the basket" do
        expect { basket.add!(product.code) }.to raise_error('ProductInvalid')
      end
    end
  end

  describe '#total' do
    let(:store) { double('Store') }

    context 'basket with products' do
      let(:product1) { double('Product', price: Price.new(3)) }
      let(:product2) { double('Product', price: Price.new(5)) }
      let(:product3) { double('Product', price: Price.new(10)) }
      let(:products) { [product1, product2, product3] }

      it 'returns the sum of prices of the products' do
        allow(store).to receive(:find_product).and_return(*products)
        %w(code1 code2 code3).each { |code| basket.add(code) }
        expect(basket.total.value).to eq(18)
      end
    end

    context 'basket without products' do
      it 'returns a total amount of 0€' do
        expect(basket.total.value).to eq(0)
      end
    end
  end
end
