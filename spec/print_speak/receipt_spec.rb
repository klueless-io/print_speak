# frozen_string_literal: true

RSpec.describe PrintSpeak::Receipt do
  let(:instance) { described_class.new(items) }
  let(:items) { [] }

  # ----------------------------------------------------------------------
  # Expected output 1
  # ----------------------------------------------------------------------
  # 1, book, 12.49
  # 1, music CD, 16.49
  # 1, chocolate bar, 0.85

  # Sales Taxes: 1.50
  # Total: 29.83

  # Local Products
  let(:book) { { quantity: 1, product: 'book', price: 12.49, category: :book } }
  let(:music) { { quantity: 1, product: 'music CD', price: 16.49 } }
  let(:chocolate) { { quantity: 1, product: 'chocolate bar', price: 20.0, category: :food } }

  # 12.49 + 16.49 + 20.00 = 48.98

  describe 'initialize' do
    subject { instance }

    context 'no items' do
      it { is_expected.to have_attributes(items: []) }
    end
  end
end
