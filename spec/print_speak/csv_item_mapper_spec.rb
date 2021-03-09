# frozen_string_literal: true

RSpec.describe PrintSpeak::CsvItemMapper do
  subject { described_class.map(csv_reader) }

  let(:csv_reader) { PrintSpeak::CsvReader.new(file) }
  let(:file) { 'spec/samples/input1.csv' }

  describe '#map' do
    it do
      is_expected
        .to  have_attributes(count: 3)
        .and include(have_attributes(quantity: 1, product: 'book', price: 12.49),
                     have_attributes(quantity: 1, product: 'music cd', price: 14.99),
                     have_attributes(quantity: 1, product: 'chocolate bar', price: 0.85))
    end

    context 'maps as type safe item' do
      subject { described_class.map(csv_reader).first }

      it { is_expected.to be_a(PrintSpeak::Item) }
    end
  end
end
