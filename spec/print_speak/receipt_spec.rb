# frozen_string_literal: true

RSpec.describe PrintSpeak::Receipt do
  let(:instance) { described_class.new(items) }
  let(:items) { [] }

  # ----------------------------------------------------------------------
  # Expected output 1
  # ----------------------------------------------------------------------
  # 1, book, 12.49
  # 1, music CD, 14.49
  # 1, chocolate bar, 0.85

  # Sales Taxes: 1.50           <-- This number is rounded from 1.449
  # Total: 29.83                <-- Incorrect: This number does not compute

  # Total Price: 27.83 - (12.49 + 14.49 + 0.85)
  #
  # book & chocolate bar are tax exempt
  # Total Taxes: 1.449 - (12.49*0) + (14.49*10%) + (0.85*0)
  #
  # Total Price with Taxes: 29.279 - (27.83 + 1.449)

  # Local Products
  let(:book) { PrintSpeak::Item.new(quantity: 1, product: 'book', price: 12.49, category: :book) }
  let(:music) { PrintSpeak::Item.new(quantity: 1, product: 'music CD', price: 14.49) }
  let(:chocolate) { PrintSpeak::Item.new(quantity: 1, product: 'chocolate bar', price: 0.85, category: :food) }

  describe 'initialize' do
    subject { instance }

    context 'no items' do
      it { is_expected.to have_attributes(items: [], total_price: 0.0) }
    end

    context 'with items' do
      subject { instance.items.count }

      let(:items) { [book, music, chocolate] }

      it { is_expected.to eq(3) }
    end
  end

  describe '.total_price' do
    subject { instance.total_price.round(2) }

    let(:items) { [book, music, chocolate] }

    context 'with local items' do
      # Total Price: 27.83 - (12.49 + 14.49 + 20.00)
      it { is_expected.to eq(27.83) }
    end
  end

  describe '.total_taxes' do
    subject { instance.total_taxes }

    let(:items) { [book, music, chocolate] }

    context 'with local items' do
      # (12.49*0) + (14.49*10%) + (0.85*0) = 1.449
      it { is_expected.to eq(1.449) }
    end
  end

  describe '.total_price_with_tax' do
    subject { instance.total_price_with_tax }

    let(:items) { [book, music, chocolate] }

    context 'with local items' do
      # Total Price with Taxes: 29.279 - (27.83 + 1.449)
      it { is_expected.to eq(29.279) }
    end
  end

end
