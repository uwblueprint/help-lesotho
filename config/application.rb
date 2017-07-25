require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HelpLesotho
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.action_dispatch.rescue_responses["Pundit::NotAuthorizedError"] = :forbidden

    # Use webpack for frontend builds
    config.assets.enabled = false

    # Dont generate front end files when generating a controller
    config.generators.assets = false
  end
end
