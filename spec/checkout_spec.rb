require 'spec_helper'

describe Checkout do
  let(:basket) { double('Basket') }
  let(:engine) { double('Engine') }
  let(:checkout) { described_class.new(engine, basket) }

  describe '#scan' do
    it 'adds the product to the basket' do
      expect(basket).to receive(:add).with('code')
      checkout.scan('code')
    end
  end

  describe '#total' do
    context 'with discount' do
      it 'deducts the discount from the total of the basket' do
        discount = double('Result', as_discount: Price.new(5))
        expect(basket).to receive(:total).and_return Price.new(20)
        expect(engine).to receive(:execute).and_return(discount)
        expect(checkout.total).to eq('15.00€')
      end
    end

    context 'without discounts' do
      it 'returns 0€ when no item is scanned' do
        discount = double('Result', as_discount: Price.zero)
        expect(basket).to receive(:total).and_return Price.zero
        expect(engine).to receive(:execute).and_return(discount)
        expect(checkout.total).to eq('0.00€')
      end

      it 'returns the total price of the basket' do
        discount = double('Result', as_discount: Price.zero)
        expect(basket).to receive(:total).and_return Price.new(20)
        expect(engine).to receive(:execute).and_return(discount)
        expect(checkout.total).to eq('20.00€')
      end
    end
  end

  describe '#clear' do
    it 'removes all products from the basket' do
      expect(basket).to receive(:clear)
      checkout.clear
    end
  end
end
