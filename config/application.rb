require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module ScrumBoost
  class Application < Rails::Application
    config.load_defaults 6.0

    config.generators do |g|
      g.test_framework :rspec,
        view_specs: false,
        helper_specs: false,
        controller_specs: false,
        routing_specs: false
    end
  end
end
