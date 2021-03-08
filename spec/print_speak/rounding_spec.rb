# frozen_string_literal: true

RSpec.describe PrintSpeak::Rounding do
  let(:instance) { Class.new.extend(described_class) }

  describe '#round_to' do
    context 'to: 0.05 (nearest 5 cents)' do
      subject { instance.round_to(amount) }

      context '23 cents -> 25 cents' do
        let(:amount) { 0.23 }
        it { is_expected.to eq(0.25) }
      end

      context '22 cents -> 20 cents' do
        let(:amount) { 0.22 }
        it { is_expected.to eq(0.20) }
      end
    end

    context 'to: 0.1 (10 cents)' do
      subject { instance.round_to(amount, to: 0.1) }

      context '25 cents -> 30 cents' do
        let(:amount) { 0.25 }
        it { is_expected.to eq(0.30) }
      end

      context '23 cents -> 20 cents' do
        let(:amount) { 0.23 }
        it { is_expected.to eq(0.20) }
      end
    end

    context 'to: 0.5 (50 cents)' do
      subject { instance.round_to(amount, to: 0.5) }

      context '73 cents -> 50 cents' do
        let(:amount) { 0.73 }
        it { is_expected.to eq(0.50) }
      end

      context '77 cents -> $1' do
        let(:amount) { 0.77 }
        it { is_expected.to eq(1) }
      end
    end
  end
end
