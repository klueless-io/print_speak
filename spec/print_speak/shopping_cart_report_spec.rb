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
end
