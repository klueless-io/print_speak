# frozen_string_literal: true

RSpec.describe Print::Speak do
  it 'has a version number' do
    expect(Print::Speak::VERSION).not_to be nil
  end

  it 'has a standard error' do
    expect { raise Print::Speak::Error, 'some message' }
      .to raise_error('some message')
  end
end
