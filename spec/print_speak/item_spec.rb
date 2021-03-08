# frozen_string_literal: true

RSpec.describe PrintSpeak::Item do
  let(:instance) { described_class.new(opts) }
  let(:opts) { {} }
  let(:product) { { quantity: 1, product: 'general-product', price: 100.0 } }
  let(:book) { { quantity: 1, product: 'some-book', price: 10.0, category: :book } }
  let(:food) { { quantity: 1, product: 'some-food', price: 20.0, category: :food } }
  let(:medical) { { quantity: 1, product: 'some-medical-supply', price: 30.0, category: :medical } }

  describe 'initialize' do
    subject { instance }

    context 'no options' do
      it { expect { subject }.to raise_error(PrintSpeak::Error) }
    end

    context 'with invalid options' do
      let(:opts) { product }
      context '.quantity' do
        before { product.delete(:quantity) }
        it { expect { subject }.to raise_error(PrintSpeak::Error, 'Quantity required') }
      end
      context '.price' do
        before { product.delete(:price) }
        it { expect { subject }.to raise_error(PrintSpeak::Error, 'Price required') }
      end
      context '.product' do
        before { product.delete(:product) }
        it { expect { subject }.to raise_error(PrintSpeak::Error, 'Product required') }
      end
    end

    context 'with required parameters' do
      let(:opts) { product }
      it do
        is_expected
          .to  have_attributes(quantity: 1,
                               product: 'general-product',
                               price: 100,
                               category: be_nil)
      end

      context 'and optional parameters' do
        let(:opts) { product.merge({ category: :xxx, imported: true }) }
        it do
          is_expected
            .to  have_attributes(quantity: 1,
                                 product: 'general-product',
                                 price: 100,
                                 category: :xxx,
                                 imported: true)
        end
      end
    end

  end
end
