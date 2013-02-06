require 'simplecov'
SimpleCov.start do
  add_group 'Controllers', 'app/controllers'
  add_group 'Models', 'app/models'
  add_group 'Views', 'app/views'
  add_group 'Helpers', 'app/helpers'
   add_group 'Mailers', 'app/mailers'
  add_group 'Tests', 'test'
end

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
#require "minitest/reporters"

MiniTest::Reporters.use!


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end



#ENV["RAILS_ENV"] = "test"
#require File.expand_path('../../config/environment', __FILE__)
#require 'rails/test_help'
#
#class ActiveSupport::TestCase
#  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
#  #
#  # Note: You'll currently still have to declare fixtures explicitly in integration tests
#  # -- they do not yet inherit this setting
#  fixtures :all
#
#  # Add more helper methods to be used by all tests here...
#end
