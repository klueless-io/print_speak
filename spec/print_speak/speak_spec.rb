# frozen_string_literal: true

RSpec.describe PrintSpeak do
  it 'has a version number' do
    expect(PrintSpeak::VERSION).not_to be nil
  end

  it 'has a standard error' do
    expect { raise PrintSpeak::Error, 'some message' }
      .to raise_error('some message')
  end
end
