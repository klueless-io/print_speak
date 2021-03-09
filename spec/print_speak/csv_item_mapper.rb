# frozen_string_literal: true

RSpec.describe PrintSpeak::CsvItemMap do
  subject { described_class.map(csv_reader) }

  let(:csv_reader) { PrintSpeak::CsvReader.new(file) }
  let(:file) { 'spec/samples/input1.csv' }

  describe 'xxx' do
    # Do somethings
  end
end
