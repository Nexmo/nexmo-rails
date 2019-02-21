require 'spec_helper'
require 'generator_spec'
require './lib/generators/nexmo_initializer/nexmo_initializer_generator.rb'

describe NexmoInitializerGenerator, type: :generator do
    destination File.expand_path("../../tmp", __FILE__)
  
    before(:all) do
      prepare_destination
      run_generator
    end
    
    it "creates a Nexmo initializer" do
      assert_file "config/initializers/nexmo.rb"
    end

    it "adds a Nexmo instance to the initializer" do
      assert_file "config/initializers/nexmo.rb", /::Nexmo = Nexmo::Client.new do |config|/
    end
  end