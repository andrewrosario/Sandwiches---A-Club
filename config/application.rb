require_relative 'boot'

require 'rails/all'
# config.secret_key_base = '95d9b31ee73ecc8f8e798b84d277a530'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module SandwichesAClub
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.exceptions_app = self.routes
    # config.secret_key_base = '97ed5d0478f5e0fe7d72e9c21ab3aa781baa144272d09f\ced43a57b52474c5ef15df3e946353b2e98089495247ff5f866d5907ff20adddebcb0db57b6bb6c70c'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.secret_key_base = ENV["SECRET_KEY_BASE"]
  end
end
