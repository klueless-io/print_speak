# frozen_string_literal: true

RSpec.describe PrintSpeak::Item do
  let(:instance) { described_class.new(opts) }
  let(:opts) { {} }

  # Local Products
  let(:product) { { quantity: 1, product: 'general-product', price: 100.0 } }
  let(:book) { { quantity: 1, product: 'some-book', price: 10.0, category: :book } }
  let(:food) { { quantity: 1, product: 'some-food', price: 20.0, category: :food } }
  let(:medical) { { quantity: 1, product: 'some-medical-supply', price: 30.0, category: :medical } }

  # Imported Products
  let(:imported_product) { product.merge(imported: true) }
  let(:imported_book) { book.merge(imported: true) }
  let(:imported_food) { food.merge(imported: true) }
  let(:imported_medical) { medical.merge(imported: true) }

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
          .to have_attributes(quantity: 1,
                              product: 'general-product',
                              price: 100,
                              category: be_nil)
      end

      context 'and optional parameters' do
        let(:opts) { product.merge({ category: :xxx, imported: true }) }
        it do
          is_expected
            .to have_attributes(quantity: 1,
                                product: 'general-product',
                                price: 100,
                                category: :xxx,
                                imported: true)
        end
      end

      context 'with parameter injection attack' do
        context 'update read-only fields' do
          let(:opts) { product.merge({ sales_tax: 20.0, import_duty: 20.0 }) }
          it do
            is_expected
              .to  have_attributes(quantity: 1,
                                   product: 'general-product',
                                   price: 100,
                                   sales_tax: 10.0,
                                   import_duty: 0)
          end
        end
        context 'update some internal data' do
          let(:opts) { product.merge({ xxx: 'bad actor'}) }
          it { expect(instance.instance_variable_get("@xxx")).not_to eq('bad actor') }
        end
      end
    end

    describe '.sales_tax' do
      subject { instance.sales_tax }

      context 'for general product' do
        let(:opts) { product }
        it { is_expected.to eq(10.0) }
      end
      context 'for book' do
        let(:opts) { book }
        it { is_expected.to eq(0.0) }
      end
      context 'for food' do
        let(:opts) { food }
        it { is_expected.to eq(0.0) }
      end
      context 'for medical' do
        let(:opts) { medical }
        it { is_expected.to eq(0.0) }
      end
    end

    describe '.import_duty' do
      subject { instance.import_duty }

      context 'on local goods' do
        context 'for product' do
          let(:opts) { product }
          it { is_expected.to eq(0.0) }
        end
        context 'for book' do
          let(:opts) { book }
          it { is_expected.to eq(0.0) }
        end
        context 'for food' do
          let(:opts) { food }
          it { is_expected.to eq(0.0) }
        end
        context 'for medical' do
          let(:opts) { medical }
          it { is_expected.to eq(0.0) }
        end
      end
      context 'on imported goods' do
        context 'for product' do
          let(:opts) { product }
          it { is_expected.to eq(0.0) }
        end
        context 'for book' do
          let(:opts) { book }
          it { is_expected.to eq(0.0) }
        end
        context 'for food' do
          let(:opts) { food }
          it { is_expected.to eq(0.0) }
        end
        context 'for medical' do
          let(:opts) { medical }
          it { is_expected.to eq(0.0) }
        end
      end
    end
  end
end
