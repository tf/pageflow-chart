require 'ostruct'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require 'rspec/rails'

engine_root = File.join(File.dirname(__FILE__), '..')
Dir[File.join(engine_root, 'spec/support/**/*.rb')].each { |file| require(file) }

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!
  config.order = "random"
end

module Pageflow
  def self.config
    OpenStruct.new( paperclip_s3_default_options: {})
  end
end
