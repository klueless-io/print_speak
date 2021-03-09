# frozen_string_literal: true

RSpec.describe PrintSpeak::ShoppingCartReport do
  let(:instance) { described_class.new(file) }

  let(:input1) { 'spec/samples/input1.csv' }
  let(:input2) { 'spec/samples/input2.csv' }
  let(:input3) { 'spec/samples/input3.csv' }
  let(:expected_outputs) { File.read('spec/samples/expected_outputs.txt') }

  let(:file) { input1 }

  describe 'initialize' do
    subject { instance }

    it { is_expected.not_to be_nil }
  end

  # describe 'check validity of input files' do
  #   let(:book) { PrintSpeak::Item.new(quantity: 1, product: 'book', price: 12.49) }
  #   let(:music_cd) { PrintSpeak::Item.new(quantity: 1, product: 'music cd', price: 14.99) }
  #   let(:chocolate) { PrintSpeak::Item.new(quantity: 1, product: 'chocolate bar', price: 0.85) }
  #   it do
  #     book.debug
  #     music_cd.debug
  #     chocolate.debug
  #   end

  #   it do
  #     puts (book.price_with_tax + music_cd.price_with_tax + chocolate.price_with_tax)
  #   end
  # end

  describe '.receipt' do
    subject { instance.receipt }

    it { is_expected.not_to be_nil }
  end

  # describe '.build_report' do
  #   subject { instance.build_report }

  #   it { is_expected.not_to be_nil }

  #   context 'functional test on input1.csv' do
  #     let(:file) { input1 }

  #     it { expect(expected_outputs).to include(subject) }
  #   end

  #   context 'functional test on input2.csv' do
  #     let(:file) { input2 }

  #     it { expect(expected_outputs).to include(subject) }
  #   end

  #   context 'functional test on input3.csv' do
  #     let(:file) { input3 }

  #     it { expect(expected_outputs).to include(subject) }
  #   end
  # end

  # Debug test, uncomment only for testings
  # describe 'print reports' do
  #   it do
  #     puts '-' * 70
  #     puts input1
  #     puts '-' * 70
  #     described_class.new(input1).print
  #     puts '-' * 70
  #     puts input2
  #     puts '-' * 70
  #     described_class.new(input2).print
  #     puts '-' * 70
  #     puts input3
  #     puts '-' * 70
  #     described_class.new(input3).print
  #     puts '-' * 70
  #   end
  # end
end
