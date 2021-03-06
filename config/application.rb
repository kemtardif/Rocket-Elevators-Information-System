require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RocketElevatorsInformationSystem
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.

    config.action_dispatch.default_headers.merge!(
      'Cache-Control' => 'no-store, no-cache'
    )
    config.load_defaults 5.2

    config.assets.paths << Rails.root.join('app/assets/javascripts/plugins/bootstrap/js')
    config.assets.paths << Rails.root.join('app/assets/javascripts/plugins/jquery')
    config.assets.paths << Rails.root.join('app/assets/javascripts/plugins/owl-carousel')
    config.assets.paths << Rails.root.join('app/assets/javascripts/plugins/slider.revolution/js')
    config.assets.paths << Rails.root.join('app/assets/javascripts/view')
    config.assets.paths << Rails.root.join("app", "assets", "images", "fonts")
    config.assets.precompile += %w( quote.js )

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
