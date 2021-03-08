# frozen_string_literal: true

RSpec.describe PrintSpeak::Item do
  let(:instance) { described_class.new }

  describe 'initialize' do
    subject { instance }

    it { is_expected.not_to be_nil }
  end
end
