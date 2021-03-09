# frozen_string_literal: true

RSpec.describe PrintSpeak::CsvItemMapper do
  subject { described_class.map(csv_reader) }

  let(:csv_reader) { PrintSpeak::CsvReader.new(file) }
  let(:file) { 'spec/samples/input1.csv' }

  describe '#hash_array' do
    it do
      is_expected
        .to  have_attributes(count: 3)
        .and include(include(quantity: 1, product: 'book', price: 12.49),
                     include(quantity: 1, product: 'music cd', price: 14.99),
                     include(quantity: 1, product: 'chocolate bar', price: 0.85))
    end
  end
end
