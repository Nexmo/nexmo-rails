require 'spec_helper'

describe NexmoRails::VERSION do
  it 'is a number' do
    stub_const("NexmoRails::VERSION", 2)

    expect(NexmoRails::VERSION).to eq(2)
  end
end