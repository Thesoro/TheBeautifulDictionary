ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/autorun"
require "minitest/rails"
require "minitest/rails/capybara"
require "minitest/reporters"

Minitest::Reporters.use!

class ActiveSupport::TestCase
  include Rails.application.routes.url_helpers
  include Capybara::DSL
end
