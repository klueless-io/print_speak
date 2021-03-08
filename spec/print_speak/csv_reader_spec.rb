# frozen_string_literal: true

RSpec.describe PrintSpeak::CsvReader do
  let(:instance) { described_class.new(file) }
  let(:input1) { 'spec/samples/input1.csv' }
  let(:input2) { 'spec/samples/input2.csv' }
  let(:input3) { 'spec/samples/input3.csv' }

  let(:file) { input1 }

  describe 'initialize' do
    subject { instance }
    context 'file not found' do
      let(:file) { 'bad_file.csv' }
      it { expect { subject }.to raise_error(PrintSpeak::Error, 'file not found') }
    end

    context 'file found' do
      it { expect { subject }.not_to raise_error }
    end
  end

  describe '.headings' do
    subject { instance.headings }
    it do
      is_expected
        .to  have_attributes(count: 3)
        .and eq(%w[Quantity Product Price])
    end
  end

  describe '.rows' do
    subject { instance.rows }
    it do
      is_expected
        .to  have_attributes(count: 3)
        .and include(include(1, 'book', 12.49),
                     include(1, 'music cd', 14.99),
                     include(1, 'chocolate bar', 0.85))
    end
  end
end
