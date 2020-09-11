# frozen_string_literal: true

require 'spec_helper'
require 'generator_spec'
require 'rails_helper'
require './lib/generators/vonage_initializer/vonage_initializer_generator.rb'

describe VonageInitializerGenerator, type: :generator do
  destination File.expand_path('../tmp', __dir__)

  before(:all) do
    prepare_destination
    run_generator
  end

  describe 'vonage_initializer_generator' do
    it 'creates a Vonage initializer' do
      assert_file 'config/initializers/vonage.rb'
    end
  end
end
