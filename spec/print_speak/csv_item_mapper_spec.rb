# frozen_string_literal: true

RSpec.describe PrintSpeak::CsvItemMapper do
  subject { described_class.map(csv_reader) }

  let(:csv_reader) { PrintSpeak::CsvReader.new(file) }

  let(:input1) { 'spec/samples/input1.csv' }
  let(:input2) { 'spec/samples/input2.csv' }
  let(:input3) { 'spec/samples/input3.csv' }

  let(:file) { input1 }

  describe '#map' do
    context 'local products' do
      it do
        is_expected
          .to  have_attributes(count: 3)
          .and include(have_attributes(quantity: 1, product: 'book', price: 12.49, category: :book, imported: false),
                       have_attributes(quantity: 1, product: 'music cd', price: 14.99, category: :general, imported: false),
                       have_attributes(quantity: 1, product: 'chocolate bar', price: 0.85, category: :food, imported: false))
      end
    end

    context 'maps as type safe item' do
      subject { described_class.map(csv_reader).first }

      it { is_expected.to be_a(PrintSpeak::Item) }
    end

    context 'imported products' do
      let(:file) { input2 }
      it do
        is_expected
          .to  have_attributes(count: 2)
          .and include(have_attributes(quantity: 1, product: 'imported box of chocolates', price: 10.00, category: :food, imported: true),
                       have_attributes(quantity: 1, product: 'imported bottle of perfume', price: 47.50, category: :general, imported: true))
      end
      # it { subject.each(&:debug) }
    end

    context 'local and imported products' do
      let(:file) { input3 }
      it do
        is_expected
          .to  have_attributes(count: 4)
          .and include(have_attributes(quantity: 1, product: 'imported bottle of perfume', price: 27.99, category: :general, imported: true),
                       have_attributes(quantity: 1, product: 'bottle of perfume', price: 18.99, category: :general, imported: false),
                       have_attributes(quantity: 1, product: 'packet of headache pills', price: 9.75, category: :medical, imported: false),
                       have_attributes(quantity: 1, product: 'box of imported chocolates', price: 11.25, category: :food, imported: true))
      end
    end
  end
end
