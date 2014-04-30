ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"


class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  include Rails.application.routes.url_helpers
  include Capybara::DSL
  fixtures :all
end
