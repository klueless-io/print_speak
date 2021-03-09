# frozen_string_literal: true

RSpec.describe PrintSpeak::ShoppingCartReport do
  let(:instance) { described_class.new(file) }

  let(:input1) { 'spec/samples/input1.csv' }
  let(:input2) { 'spec/samples/input2.csv' }
  let(:input3) { 'spec/samples/input3.csv' }

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

    # it { is_expected.not_to be_nil }
    # fit { is_expected.to have_attributes(total_price: be_within(0.1).of(31.63)) }
    # items: have_attributes(count: 3),
  end
end
