require File.expand_path('../boot', __FILE__)

require "active_model/railtie"
# require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
require "rails/test_unit/railtie"


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BeautifulDictionary
  class Application < Rails::Application

    config.generators do |g|
      g.test_framework :minitest, spec: true, fixture: true
    end

    # Mongoid.logger.level = Logger::DEBUG
    # Moped.logger.level = Logger::DEBUG

  end
end
